import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:automated_testing_framework/automated_testing_framework.dart';
import 'package:automated_testing_framework_plugin_images/automated_testing_framework_plugin_images.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:example/src/components/clipper.dart';
import 'package:example/src/custom_function/show_dialog.dart'
    as show_dialog_fun;
import 'package:example/src/custom_schemas/dotted_border_schema.dart';
import 'package:example/src/custom_schemas/svg_schema.dart';
import 'package:example/src/dotted_border_builder.dart';
import 'package:example/src/issue_24_page.dart';
import 'package:example/src/svg_builder.dart';
import 'package:example/src/untestable_full_widget_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme_schemas.dart';
import 'package:logging/logging.dart';

import 'src/full_widget_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  TestAppSettings.initialize(appIdentifier: 'JSON Dynamic Widget');
  var testRegistry = TestStepRegistry.instance;
  TestImagesHelper.registerTestSteps(testRegistry);

  if (!kIsWeb &&
      (Platform.isLinux ||
          Platform.isFuchsia ||
          Platform.isMacOS ||
          Platform.isWindows)) {
    await DesktopWindow.setWindowSize(Size(1024, 768));
  }

  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
    if (record.error != null) {
      debugPrint('${record.error}');
    }
    if (record.stackTrace != null) {
      debugPrint('${record.stackTrace}');
    }
  });

  var navigatorKey = GlobalKey<NavigatorState>();

  // This is needed to adding custom schema validations
  var schemaCache = SchemaCache();
  schemaCache.addSchema(SvgSchema.id, SvgSchema.schema);
  schemaCache.addSchema(DottedBorderSchema.id, DottedBorderSchema.schema);

  var registry = JsonWidgetRegistry.instance;
  registry.navigatorKey = navigatorKey;
  registry.registerCustomBuilder(
    DottedBorderBuilder.type,
    JsonWidgetBuilderContainer(
      builder: DottedBorderBuilder.fromDynamic,
      schemaId: DottedBorderSchema.id,
    ),
  );
  registry.registerCustomBuilder(
    SvgBuilder.type,
    JsonWidgetBuilderContainer(
      builder: SvgBuilder.fromDynamic,
      schemaId: SvgSchema.id,
    ),
  );

  registry.registerFunction('navigatePage', ({args, required registry}) async {
    var jsonStr = await rootBundle.loadString('assets/pages/${args![0]}.json');
    var jsonData = json.decode(jsonStr);
    await navigatorKey.currentState!.push(
      MaterialPageRoute(
        builder: (BuildContext context) => FullWidgetPage(
          data: JsonWidgetData.fromDynamic(
            jsonData,
            registry: registry,
          )!,
        ),
      ),
    );
  });
  registry.registerFunctions({
    'getImageAsset': ({args, required registry}) =>
        'assets/images/image${args![0]}.jpg',
    'getImageId': ({args, required registry}) => 'image${args![0]}',
    'getImageNavigator': ({args, required registry}) => () async {
          registry.setValue('index', args![0]);
          var dataStr =
              await rootBundle.loadString('assets/pages/image_page.json');
          final imagePageJson = Map.unmodifiable(json.decode(dataStr));
          var imgRegistry = JsonWidgetRegistry(
            debugLabel: 'ImagePage',
            values: {
              'imageAsset': 'assets/images/image${args[0]}.jpg',
              'imageTag': 'image${args[0]}',
            },
          );

          await navigatorKey.currentState!.push(
            MaterialPageRoute(
              builder: (BuildContext context) => FullWidgetPage(
                data: JsonWidgetData.fromDynamic(
                  imagePageJson,
                  registry: imgRegistry,
                )!,
              ),
            ),
          );
        },
    'noop': ({args, required registry}) => () {},
    'validateForm': ({args, required registry}) => () {
          BuildContext context = registry.getValue(args![0]);

          var valid = Form.of(context)!.validate();
          registry.setValue('form_validation', valid);
        },
    'updateCustomTextStyle': ({args, required registry}) => () {
          registry.setValue(
            'customTextStyle',
            TextStyle(
              color: Colors.black,
            ),
          );
        },
    'getCustomTweenBuilder': ({args, required registry}) =>
        (BuildContext context, dynamic size, Widget? child) {
          return IconButton(
            icon: child!,
            iconSize: size,
            onPressed: () {
              var _current = registry.getValue('customSize');
              var _size = _current == 50.0 ? 100.0 : 50.0;
              registry.setValue('customSize', _size);
            },
          );
        },
    'getCustomTween': ({args, required registry}) {
      return Tween<double>(begin: 0, end: args![0]);
    },
    'setWidgetByKey': ({args, required registry}) => () {
          var _replace = registry.getValue(args![1]);
          registry.setValue(args[0], _replace);
        },
    'simplePrintMessage': ({args, required registry}) => () {
          var message = 'This is a simple print message';
          if (args?.isEmpty == false) {
            for (var arg in args!) {
              message += ' $arg';
            }
          }
          // ignore: avoid_print
          print(message);
        },
    'negateBool': ({args, required registry}) => () {
          bool value = registry.getValue(args![0]);
          registry.setValue(args[0], !value);
        },
    'buildPopupMenu': ({args, required registry}) {
      const choices = ['First', 'Second', 'Third'];
      return (BuildContext context) {
        return choices
            .map(
              (choice) => PopupMenuItem(
                value: choice,
                child: Text(choice),
              ),
            )
            .toList();
      };
    },
    show_dialog_fun.key: show_dialog_fun.body,
  });

  registry.setValue('customRect', Rect.largest);
  registry.setValue('clipper', Clipper());

  var assetTestStore = AssetTestStore(
    testAssetIndex: 'assets/testing/tests/all.json',
  );

  var desktop = !kIsWeb &&
      (Platform.isFuchsia ||
          Platform.isLinux ||
          Platform.isMacOS ||
          Platform.isWindows);

  var ioTestStore = IoTestStore();

  var testController = TestController(
    goldenImageWriter:
        !desktop ? TestStore.goldenImageWriter : ioTestStore.goldenImageWriter,
    navigatorKey: navigatorKey,
    onReset: () async => navigatorKey.currentState!.popUntil(
      (route) => navigatorKey.currentState!.canPop() != true,
    ),
    registry: testRegistry,
    testImageReader: !desktop
        ? TestStore.testImageReader
        : (desktop && kDebugMode)
            ? ioTestStore.testImageReader
            : ({
                required TestDeviceInfo deviceInfo,
                required String imageId,
                String? suiteName,
                required String testName,
                int? testVersion,
              }) async {
                var path = 'assets/testing/images';

                if (suiteName?.isNotEmpty == true) {
                  path = '${path}/_Suite_${suiteName}_';
                } else {
                  path = '$path/';
                }

                path = '${path}Test_${testName}_$imageId.png';

                Uint8List? image;

                try {
                  image = (await rootBundle.load(path)).buffer.asUint8List();
                } catch (e) {
                  // no_op
                }

                return image;
              },
    testReader: kIsWeb || !kDebugMode || !desktop
        ? assetTestStore.testReader
        : ioTestStore.testReader,
    testReporter: !desktop ? TestStore.testReporter : ioTestStore.testReporter,
    testWriter:
        !desktop ? ClipboardTestStore.testWriter : ioTestStore.testWriter,
    variables: {
      CompareGoldenImageStep.kDisableGoldenImageFailOnMissingVariable:
          kIsWeb || kDebugMode,
    },
  );

  runApp(
    TestRunner(
      controller: testController,
      enabled: !kReleaseMode,
      theme: ThemeData.light(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: kReleaseMode
            ? RootPage()
            : ResetPage(
                navigatorKey: navigatorKey,
              ),
        navigatorKey: navigatorKey,
        theme: ThemeData.light(),
      ),
    ),
  );
}

class ResetPage extends StatefulWidget {
  ResetPage({
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  ResetPageState createState() => ResetPageState();
}

class ResetPageState extends State<ResetPage> {
  @override
  void initState() {
    super.initState();

    _navigateHome();
  }

  Future<void> _navigateHome() async {
    while (true) {
      await Future.delayed(Duration(milliseconds: 300));
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => RootPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(),
      );
}

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  static final _pages = {
    'align': _onPageSelected,
    'animated_align': _onPageSelected,
    'animated_container': _onPageSelected,
    'animated_cross_fade': _onPageSelected,
    'animated_default_text_style': _onPageSelected,
    'animated_opacity': _onPageSelected,
    'animated_padding': _onPageSelected,
    'animated_physical_model': _onPageSelected,
    'animated_positioned': _onPageSelected,
    'animated_positioned_directional': _onPageSelected,
    'animated_size': _onPageSelected,
    'animated_switcher': _onPageSelected,
    'animated_theme': _onPageSelected,
    'aspect_ratio': _onPageSelected,
    'asset_images': _onPageSelected,
    'bank_example': _onPageSelected,
    'baseline': _onPageSelected,
    'buttons': _onPageSelected,
    'card': _onPageSelected,
    'center': _onPageSelected,
    'checkbox': _onPageSelected,
    'circular_progress_indicator': _onPageSelected,
    'clips': _onPageSelected,
    'conditional': _onPageSelected,
    'cupertino_switch': _onPageSelected,
    'decorated_box': _onPageSelected,
    'directionality': _onPageSelected,
    'dynamic': _onUntestablePageSelected,
    'fitted_box': _onPageSelected,
    'for_each': _onPageSelected,
    'form': _onPageSelected,
    'fractional_translation': _onPageSelected,
    'fractionally_sized_box': _onPageSelected,
    'gestures': _onPageSelected,
    'images': _onPageSelected,
    'indexed_stack': _onPageSelected,
    'input_error': _onPageSelected,
    'interactive_viewer': _onPageSelected,
    'intrinsic_height': _onPageSelected,
    'intrinsic_width': _onPageSelected,
    'issue_10': _onPageSelected,
    'issue_11': _onPageSelected,
    'issue_12': _onPageSelected,
    'issue_20_list': _onPageSelected,
    'issue_20_single': _onPageSelected,
    'issue_24': (context, _) async => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => Issue24Page(),
          ),
        ),
    'issue_30': _onPageSelected,
    'layout_builder': _onPageSelected,
    'limited_box': _onPageSelected,
    'linear_progress_indicator': _onPageSelected,
    'list_view': _onPageSelected,
    'measured': _onPageSelected,
    'offstage': _onPageSelected,
    'opacity': _onPageSelected,
    'overflow_box': _onPageSelected,
    'placeholder': _onPageSelected,
    'popup_menu_button': _onPageSelected,
    'simple_page': _onPageSelected,
    'switch': _onPageSelected,
    'theme': _onPageSelected,
    'tween_animation': _onPageSelected,
    'variables': _onPageSelected,
  };

  @override
  Widget build(BuildContext context) {
    var names = _pages.keys.toList();
    names.sort();

    return Scaffold(
      appBar: AppBar(
        actions: !kIsWeb && kDebugMode
            ? [
                IconButton(
                  icon: Icon(Icons.bug_report),
                  onPressed: () async {
                    var testController = TestController.of(context)!;
                    var tests = await testController.loadTests(context);

                    var passed = true;
                    for (var test in tests!) {
                      var report = await testController.executeTest(
                        test: await test.loader.load(ignoreImages: true),
                      );

                      if (report.success) {
                        await testController.goldenImageWriter(report);
                      }

                      passed = passed && report.success;
                    }
                  },
                ),
              ]
            : null,
        title: Text('Select Widget / Page'),
      ),
      body: ListView.builder(
        itemCount: _pages.length,
        itemBuilder: (BuildContext context, int index) => Testable(
          id: 'home_${names[index]}',
          child: ListTile(
            title: Text(names[index]),
            onTap: () => _pages[names[index]]!(context, names[index]),
          ),
        ),
      ),
    );
  }

  static Future<void> _onPageSelected(
    BuildContext context,
    String themeId,
  ) async {
    var registry = JsonWidgetRegistry.instance.copyWith();
    var pageStr = await rootBundle.loadString('assets/pages/$themeId.json');
    var dataJson = json.decode(pageStr);

    // This is put in to give credit for when designs from online were used in
    // example files.  It's not actually a valid attribute to exist in the JSON
    // so it needs to be removed before we create the widget.
    dataJson.remove('_designCredit');

    var data = JsonWidgetData.fromDynamic(
      dataJson,
      registry: registry,
    );

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => FullWidgetPage(
          data: data!,
        ),
      ),
    );
  }

  static Future<void> _onUntestablePageSelected(
    BuildContext context,
    String themeId,
  ) async {
    var registry = JsonWidgetRegistry.instance.copyWith();
    var pageStr = await rootBundle.loadString('assets/pages/$themeId.json');
    var dataJson = json.decode(pageStr);

    // This is put in to give credit for when designs from online were used in
    // example files.  It's not actually a valid attribute to exist in the JSON
    // so it needs to be removed before we create the widget.
    dataJson.remove('_designCredit');

    var data = JsonWidgetData.fromDynamic(
      dataJson,
      registry: registry,
    );

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => UntestableFullWidgetPage(
          data: data!,
        ),
      ),
    );
  }
}
