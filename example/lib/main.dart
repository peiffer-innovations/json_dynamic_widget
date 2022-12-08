import 'dart:convert';
import 'dart:io';

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
import 'package:yaon/yaon.dart' as yaon;

import 'src/full_widget_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb &&
      (Platform.isLinux ||
          Platform.isFuchsia ||
          Platform.isMacOS ||
          Platform.isWindows)) {
    await DesktopWindow.setWindowSize(const Size(1024, 768));
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

  final navigatorKey = GlobalKey<NavigatorState>();

  // This is needed to adding custom schema validations
  final schemaCache = SchemaCache();
  schemaCache.addSchema(SvgSchema.id, SvgSchema.schema);
  schemaCache.addSchema(DottedBorderSchema.id, DottedBorderSchema.schema);

  final registry = JsonWidgetRegistry.instance;
  registry.navigatorKey = navigatorKey;
  registry.registerCustomBuilder(
    DottedBorderBuilder.type,
    const JsonWidgetBuilderContainer(
      builder: DottedBorderBuilder.fromDynamic,
      schemaId: DottedBorderSchema.id,
    ),
  );
  registry.registerCustomBuilder(
    SvgBuilder.type,
    const JsonWidgetBuilderContainer(
      builder: SvgBuilder.fromDynamic,
      schemaId: SvgSchema.id,
    ),
  );

  registry.registerFunction('navigatePage', ({args, required registry}) async {
    final jsonStr =
        await rootBundle.loadString('assets/pages/${args![0]}.json');
    final jsonData = json.decode(jsonStr);
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
          final dataStr =
              await rootBundle.loadString('assets/pages/image_page.json');
          final imagePageJson = Map.unmodifiable(json.decode(dataStr));
          final imgRegistry = JsonWidgetRegistry(
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
          final BuildContext context = registry.getValue(args![0]);

          final valid = Form.of(context).validate();
          registry.setValue('form_validation', valid);
        },
    'updateCustomTextStyle': ({args, required registry}) => () {
          registry.setValue(
            'customTextStyle',
            const TextStyle(
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
              final _current = registry.getValue('customSize');
              final _size = _current == 50.0 ? 100.0 : 50.0;
              registry.setValue('customSize', _size);
            },
          );
        },
    'getCustomTween': ({args, required registry}) {
      return Tween<double>(begin: 0, end: args![0]);
    },
    'setWidgetByKey': ({args, required registry}) => () {
          final _replace = registry.getValue(args![1]);
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
          final bool value = registry.getValue(args![0]);
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

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
      navigatorKey: navigatorKey,
      theme: ThemeData.light(),
    ),
  );
}

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  static final _pages = {
    'align': _onJsonPageSelected,
    'animated_align': _onJsonPageSelected,
    'animated_container': _onJsonPageSelected,
    'animated_cross_fade': _onJsonPageSelected,
    'animated_default_text_style': _onJsonPageSelected,
    'animated_opacity': _onJsonPageSelected,
    'animated_padding': _onJsonPageSelected,
    'animated_physical_model': _onJsonPageSelected,
    'animated_positioned': _onJsonPageSelected,
    'animated_positioned_directional': _onJsonPageSelected,
    'animated_size': _onJsonPageSelected,
    'animated_switcher': _onJsonPageSelected,
    'animated_theme': _onJsonPageSelected,
    'aspect_ratio': _onJsonPageSelected,
    'asset_images': _onJsonPageSelected,
    'bank_example': _onJsonPageSelected,
    'baseline': _onJsonPageSelected,
    'buttons': _onJsonPageSelected,
    'card': _onJsonPageSelected,
    'center': _onJsonPageSelected,
    'checkbox': _onJsonPageSelected,
    'circular_progress_indicator': _onJsonPageSelected,
    'clips': _onJsonPageSelected,
    'conditional': _onJsonPageSelected,
    'cupertino_switch': _onYamlPageSelected,
    'decorated_box': _onJsonPageSelected,
    'directionality': _onJsonPageSelected,
    'dynamic': _onUntestablePageSelected,
    'fitted_box': _onJsonPageSelected,
    'for_each': _onJsonPageSelected,
    'form': _onJsonPageSelected,
    'fractional_translation': _onJsonPageSelected,
    'fractionally_sized_box': _onJsonPageSelected,
    'gestures': _onJsonPageSelected,
    'grid_view': _onJsonPageSelected,
    'images': _onJsonPageSelected,
    'indexed_stack': _onJsonPageSelected,
    'input_error': _onJsonPageSelected,
    'interactive_viewer': _onJsonPageSelected,
    'intrinsic_height': _onJsonPageSelected,
    'intrinsic_width': _onJsonPageSelected,
    'issue_10': _onJsonPageSelected,
    'issue_11': _onJsonPageSelected,
    'issue_12': _onJsonPageSelected,
    'issue_20_list': _onJsonPageSelected,
    'issue_20_single': _onJsonPageSelected,
    'issue_24': (context, _) async => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => Issue24Page(),
          ),
        ),
    'issue_30': _onJsonPageSelected,
    'issue_109': _onJsonPageSelected,
    'layout_builder': _onJsonPageSelected,
    'length': _onJsonPageSelected,
    'limited_box': _onJsonPageSelected,
    'linear_progress_indicator': _onJsonPageSelected,
    'list_view': _onJsonPageSelected,
    'measured': _onJsonPageSelected,
    'offstage': _onJsonPageSelected,
    'opacity': _onJsonPageSelected,
    'overflow_box': _onJsonPageSelected,
    'placeholder': _onJsonPageSelected,
    'popup_menu_button': _onJsonPageSelected,
    'radio': _onJsonPageSelected,
    'rich_text': _onJsonPageSelected,
    'scroll_view': _onJsonPageSelected,
    'set_default_value': _onJsonPageSelected,
    'simple_page': _onJsonPageSelected,
    'slivers': _onJsonPageSelected,
    'switch': _onJsonPageSelected,
    'theme': _onJsonPageSelected,
    'tooltip': _onJsonPageSelected,
    'tween_animation': _onJsonPageSelected,
    'variables': _onJsonPageSelected,
    'wrap': _onJsonPageSelected,
  };

  @override
  Widget build(BuildContext context) {
    final names = _pages.keys.toList();
    names.sort();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Widget / Page'),
      ),
      body: ListView.builder(
        itemCount: _pages.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(names[index]),
          onTap: () => _pages[names[index]]!(context, names[index]),
        ),
      ),
    );
  }

  static Future<void> _onJsonPageSelected(
    BuildContext context,
    String pageId,
  ) =>
      _onPageSelected(context, pageId, '.json');

  static Future<void> _onPageSelected(
    BuildContext context,
    String pageId,
    String extension,
  ) async {
    final registry = JsonWidgetRegistry.instance.copyWith();
    final pageStr = await rootBundle.loadString(
      'assets/pages/${pageId}$extension',
    );
    final dataJson = yaon.parse(pageStr);

    // This is put in to give credit for when designs from online were used in
    // example files.  It's not actually a valid attribute to exist in the JSON
    // so it needs to be removed before we create the widget.
    dataJson.remove('_designCredit');

    final data = JsonWidgetData.fromDynamic(
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

  static Future<void> _onYamlPageSelected(
    BuildContext context,
    String pageId,
  ) =>
      _onPageSelected(context, pageId, '.yaml');

  static Future<void> _onUntestablePageSelected(
    BuildContext context,
    String themeId,
  ) async {
    final registry = JsonWidgetRegistry.instance.copyWith();
    final pageStr = await rootBundle.loadString('assets/pages/$themeId.json');
    final dataJson = json.decode(pageStr);

    // This is put in to give credit for when designs from online were used in
    // example files.  It's not actually a valid attribute to exist in the JSON
    // so it needs to be removed before we create the widget.
    dataJson.remove('_designCredit');

    final data = JsonWidgetData.fromDynamic(
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
