import 'dart:convert';

import 'package:example/src/dotted_border_builder.dart';
import 'package:example/src/svg_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
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

  var registry = JsonWidgetRegistry.instance;
  registry.registerCustomBuilder(
    DottedBorderBuilder.type,
    DottedBorderBuilder.fromDynamic,
  );
  registry.registerCustomBuilder(
    SvgBuilder.type,
    SvgBuilder.fromDynamic,
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
  registry.registerFunction(
    'getImageAsset',
    ({args, registry}) => 'assets/images/image${args[0]}.jpg',
  );
  registry.registerFunction(
    'getImageId',
    ({args, registry}) => 'image${args[0]}',
  );

  registry.registerFunction(
    'getImageNavigator',
    ({args, registry}) => () {
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
  );

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
    'asset_images',
    'bank_example',
    'conditional',
    'images',
    'list_view',
    'simple_page',
    'theme',
  ];

  Future<void> _onPageSelected(BuildContext context, String themeId) async {
    JsonWidgetRegistry.instance.clearValues();
    var pageStr = await rootBundle.loadString('assets/pages/$themeId.json');
    var dataJson = json.decode(pageStr);

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
