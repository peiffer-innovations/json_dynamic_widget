import 'dart:convert';

import 'package:example/src/custom_schemas/dotted_border_schema.dart';
import 'package:example/src/custom_schemas/svg_schema.dart';
import 'package:example/src/dotted_border_builder.dart';
import 'package:example/src/svg_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme_schemas.dart';
import 'package:logging/logging.dart';

import 'src/full_widget_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  var dataStr = await rootBundle.loadString('assets/pages/image_page.json');
  var imagePageJson = json.decode(dataStr);

  // This is needed to adding custom schema validations
  var schemaCache = SchemaCache();
  schemaCache.addSchema(SvgSchema.id, SvgSchema.schema);
  schemaCache.addSchema(DottedBorderSchema.id, DottedBorderSchema.schema);

  var registry = JsonWidgetRegistry.instance;
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

  registry.registerFunction('navigatePage', ({args, registry}) async {
    var jsonStr = await rootBundle.loadString('assets/pages/${args[0]}.json');
    var jsonData = json.decode(jsonStr);
    await navigatorKey.currentState.push(
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
    'getImageAsset': ({args, registry}) => 'assets/images/image${args[0]}.jpg',
    'getImageId': ({args, registry}) => 'image${args[0]}',
    'getImageNavigator': ({args, registry}) => () {
          var registry = JsonWidgetRegistry(
            debugLabel: 'ImagePage',
            values: {
              'imageAsset': 'assets/images/image${args[0]}.jpg',
              'imageTag': 'image${args[0]}',
            },
          );

          navigatorKey.currentState.push(
            MaterialPageRoute(
              builder: (BuildContext context) => FullWidgetPage(
                data: JsonWidgetData.fromDynamic(
                  imagePageJson,
                  registry: registry,
                ),
              ),
            ),
          );
        },
    'noop': ({args, registry}) => () {},
    'validateForm': ({args, registry}) => () {
          BuildContext context = registry.getValue(args[0]);

          var valid = Form.of(context).validate();
          registry.setValue('form_validation', valid);
        },
    'updateCustomTextStyle': ({args, registry}) => () {
          registry.setValue(
            'customTextStyle',
            TextStyle(
              color: Colors.black,
            ),
          );
        },
    'getCustomTweenBuilder': ({args, registry}) =>
        (BuildContext context, dynamic size, Widget child) {
          return IconButton(
            icon: child,
            iconSize: size,
            onPressed: () {
              var _current = registry.getValue('customSize');
              var _size = _current == 50.0 ? 100.0 : 50.0;
              registry.setValue('customSize', _size);
            },
          );
        },
    'getCustomTween': ({args, registry}) {
      return Tween<double>(begin: 0, end: args[0]);
    },
    'setWidgetByKey': ({args, registry}) => () {
          var _replace = registry.getValue(args[1]);
          registry.setValue(args[0], _replace);
        },
    'materialCallback': ({args, registry}) => (Set<MaterialState> states) {
          const interactiveStates = <MaterialState>{
            MaterialState.pressed,
            MaterialState.focused,
          };
          if (states.any(interactiveStates.contains)) {
            return Colors.blue;
          }
          return Colors.red;
        },
    'simplePrintMessage': ({args, registry}) => () {
          var message = 'This is a simple print message';
          if (args?.isEmpty == false) {
            for (var arg in args) {
              message += ' $arg';
            }
          }
          // ignore: avoid_print
          print(message);
        },
    'negateBool': ({args, registry}) => () {
          bool value = registry.getValue(args[0]);
          registry.setValue(args[0], !value);
        },
    'buildPopupMenu': ({args, registry}) {
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
  });

  registry.setValue('customRect', Rect.largest);

  runApp(MyApp(
    navigatorKey: navigatorKey,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({
    Key key,
    @required this.navigatorKey,
  })  : assert(navigatorKey != null),
        super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RootPage(),
      navigatorKey: navigatorKey,
      theme: ThemeData.light(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    Key key,
  }) : super(key: key);

  static const _pages = [
    'align',
    'animated_align',
    'animated_container',
    'animated_cross_fade',
    'animated_default_text_style',
    'animated_opacity',
    'animated_padding',
    'animated_physical_model',
    'animated_positioned',
    'animated_positioned_directional',
    'animated_size',
    'animated_switcher',
    'animated_theme',
    'aspect_ratio',
    'asset_images',
    'bank_example',
    'baseline',
    'buttons',
    'card',
    'center',
    'checkbox',
    'circular_progress_indicator',
    'clips',
    'conditional',
    'cupertino_switch',
    'decorated_box',
    'directionality',
    'fitted_box',
    'form',
    'fractional_translation',
    'fractionally_sized_box',
    'gestures',
    'images',
    'indexed_stack',
    'input_error',
    'interactive_viewer',
    'intrinsic_height',
    'intrinsic_width',
    'issue_10',
    'issue_11',
    'issue_12',
    'limited_box',
    'linear_progress_indicator',
    'list_view',
    'offstage',
    'opacity',
    'overflow_box',
    'placeholder',
    'popup_menu_button',
    'simple_page',
    'switch',
    'theme',
    'tween_animation',
  ];

  Future<void> _onPageSelected(BuildContext context, String themeId) async {
    JsonWidgetRegistry.instance.clearValues();
    var pageStr = await rootBundle.loadString('assets/pages/$themeId.json');
    var dataJson = json.decode(pageStr);

    // This is put in to give credit for when designs from online were used in
    // example files.  It's not actually a valid attribute to exist in the JSON
    // so it needs to be removed before we create the widget.
    dataJson.remove('_designCredit');

    var data = JsonWidgetData.fromDynamic(dataJson);

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => FullWidgetPage(
          data: data,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Widget / Page'),
      ),
      body: ListView.builder(
        itemCount: _pages.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(_pages[index]),
          onTap: () => _onPageSelected(context, _pages[index]),
        ),
      ),
    );
  }
}
