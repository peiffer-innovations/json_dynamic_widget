import 'dart:convert';
import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:example/src/components/clipper.dart';
import 'package:example/src/components/example_registrar.dart';
import 'package:example/src/custom_function/show_dialog.dart'
    as show_dialog_fun;
import 'package:example/src/export_example_page.dart';
import 'package:example/src/issue_219_page.dart';
import 'package:example/src/issue_220_page.dart';
import 'package:example/src/issue_24_page.dart';
import 'package:example/src/untestable_full_widget_page.dart';
import 'package:execution_timer/execution_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:logging/logging.dart';

import 'full_widget_page.dart';

void launch() async {
  WidgetsFlutterBinding.ensureInitialized();
  TimeKeeper.enabled = true;

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

  final registry = JsonWidgetRegistry.instance;
  registry.navigatorKey = navigatorKey;
  ExampleRegistrar.registerDefaults(registry: registry);

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
          ),
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
                ),
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
              final current = registry.getValue('customSize');
              final size = current == 50.0 ? 100.0 : 50.0;
              registry.setValue('customSize', size);
            },
          );
        },
    'getCustomTween': ({args, required registry}) {
      return Tween<double>(begin: 0, end: args![0]);
    },
    'setWidgetByKey': ({args, required registry}) => () {
          final replace = registry.getValue(args![1]);
          registry.setValue(args[0], replace);
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
    'setBooleanValue': ({args, required registry}) {
      return (bool? onChangedValue) {
        final variableName = args![0];
        registry.setValue(variableName, onChangedValue);
      };
    },
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

class RootPage extends StatefulWidget {
  const RootPage({
    super.key,
  });

  @override
  State createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late final _pages = {
    'widget to json': (context, _) async => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const ExportExamplePage(),
          ),
        ),
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
    'issue_20_list': _onJsonPageSelected,
    'issue_20_single': _onJsonPageSelected,
    'issue_24': (context, _) async => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const Issue24Page(),
          ),
        ),
    'issue_30': _onJsonPageSelected,
    'issue_109': _onJsonPageSelected,
    'issue_219': (context, _) async => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const Issue219Page(),
          ),
        ),
    'issue_220': (context, _) async => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => const Issue220Page(),
          ),
        ),
    'issue_289': _onJsonPageSelected,
    'layout_builder': _onJsonPageSelected,
    'length': _onJsonPageSelected,
    'limited_box': _onJsonPageSelected,
    'linear_progress_indicator': _onJsonPageSelected,
    'list_view': _onJsonPageSelected,
    'measured': _onJsonPageSelected,
    'null_value_passing': _onJsonPageSelected,
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

  final Set<String> _visited = <String>{};

  @override
  Widget build(BuildContext context) {
    final names = _pages.keys.toList();
    names.sort();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => _TimerPage(),
              ),
            ),
            icon: const Icon(Icons.timer),
          ),
        ],
        title: const Text('Select Widget / Page'),
      ),
      body: ListView.builder(
        itemCount: _pages.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          onTap: () {
            setState(() => _visited.add(names[index]));
            _pages[names[index]]!(context, names[index]);
          },
          title: Text(names[index]),
          trailing: _visited.contains(names[index])
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                )
              : null,
        ),
      ),
    );
  }

  Future<void> _onJsonPageSelected(
    BuildContext context,
    String pageId,
  ) =>
      _onPageSelected(context, pageId, '.json');

  Future<void> _onPageSelected(
    BuildContext context,
    String pageId,
    String extension,
  ) async {
    final nav = Navigator.of(context);
    final registry = JsonWidgetRegistry.instance.copyWith();
    final pageStr = await rootBundle.loadString(
      'assets/pages/$pageId$extension',
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

    if (mounted) {
      await nav.push(
        MaterialPageRoute(
          builder: (BuildContext context) => FullWidgetPage(
            data: data,
          ),
        ),
      );
    }
  }

  Future<void> _onYamlPageSelected(
    BuildContext context,
    String pageId,
  ) =>
      _onPageSelected(context, pageId, '.yaml');

  Future<void> _onUntestablePageSelected(
    BuildContext context,
    String themeId,
  ) async {
    final registry = JsonWidgetRegistry.instance.copyWith();
    final nav = Navigator.of(context);
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

    if (mounted) {
      await nav.push(
        MaterialPageRoute(
          builder: (BuildContext context) => UntestableFullWidgetPage(
            data: data,
          ),
        ),
      );
    }
  }
}

class _TimerPage extends StatefulWidget {
  @override
  State createState() => _TimerPageState();
}

class _TimerPageState extends State<_TimerPage> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const encoder = JsonEncoder.withIndent('  ');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Timers'),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          controller: _controller,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            encoder.convert(TimeKeeper.toJson(true)),
            style: const TextStyle(
              fontFamily: 'Courier New',
              fontFamilyFallback: ['monospace', 'Courier'],
            ),
          ),
        ),
      ),
    );
  }
}
