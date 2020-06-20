import 'package:child_builder/child_builder.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_class/json_class.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_theme/json_theme.dart';

class JsonScaffoldBuilder extends JsonWidgetBuilder {
  JsonScaffoldBuilder({
    this.appBar,
    this.backgroundColor,
    this.body,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.drawerDragStartBehavior,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture,
    this.drawerScrimColor,
    this.endDrawer,
    this.endDrawerEnableOpenDragGesture,
    this.extendBody,
    this.extendBodyBehindAppBar,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.persistentFooterButtons,
    this.primary,
    this.resizeToAvoidBottomInset,
    this.resizeToAvoidBottomPadding,
  });

  static const type = 'scaffold';

  final JsonWidgetData appBar;
  final Color backgroundColor;
  final JsonWidgetData body;
  final JsonWidgetData bottomNavigationBar;
  final JsonWidgetData bottomSheet;
  final JsonWidgetData drawer;
  final DragStartBehavior drawerDragStartBehavior;
  final double drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final Color drawerScrimColor;
  final JsonWidgetData endDrawer;
  final bool endDrawerEnableOpenDragGesture;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final JsonWidgetData floatingActionButton;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final List<JsonWidgetData> persistentFooterButtons;
  final bool primary;
  final bool resizeToAvoidBottomInset;
  final bool resizeToAvoidBottomPadding;

  static JsonScaffoldBuilder fromDynamic(dynamic map) {
    JsonScaffoldBuilder result;
    if (map != null) {
      result = JsonScaffoldBuilder(
        appBar: JsonWidgetData.fromDynamic(map['appBar']),
        backgroundColor: ThemeDecoder.decodeColor(map['backgroundColor']),
        body: JsonWidgetData.fromDynamic(map['body']),
        bottomNavigationBar:
            JsonWidgetData.fromDynamic(map['bottomNavigationBar']),
        bottomSheet: JsonWidgetData.fromDynamic(map['bottomSheet']),
        drawer: JsonWidgetData.fromDynamic(map['drawer']),
        drawerDragStartBehavior: ThemeDecoder.decodeDragStartBehavior(
                map['drawerDragStartBehavior']) ??
            DragStartBehavior.start,
        drawerEdgeDragWidth: JsonClass.parseDouble(map['drawerEdgeDragWidth']),
        drawerEnableOpenDragGesture: map['drawerEnableOpenDragGesture'] == null
            ? true
            : JsonClass.parseBool(map['drawerEnableOpenDragGesture']),
        drawerScrimColor: ThemeDecoder.decodeColor(map['drawerScrimColor']),
        endDrawer: JsonWidgetData.fromDynamic(map['endDrawer']),
        endDrawerEnableOpenDragGesture:
            map['endDrawerEnableOpenDragGesture'] == null
                ? true
                : JsonClass.parseBool(map['endDrawerEnableOpenDragGesture']),
        extendBody: JsonClass.parseBool(map['extendBody']),
        extendBodyBehindAppBar:
            JsonClass.parseBool(map['extendBodyBehindAppBar']),
        floatingActionButton:
            JsonWidgetData.fromDynamic(map['floatingActionButton']),
        floatingActionButtonAnimator:
            ThemeDecoder.decodeFloatingActionButtonAnimator(
          map['floatingActionButtonAnimator'],
        ),
        floatingActionButtonLocation:
            ThemeDecoder.decodeFloatingActionButtonLocation(
          map['floatingActionButtonLocation'],
        ),
        persistentFooterButtons: map['persistentFooterButtons'] == null
            ? null
            : JsonClass.fromDynamicList(
                map['persistentFooterButtons'],
                (map) => JsonWidgetData.fromDynamic(
                  map['persistentFooterButtons'],
                ),
              ),
        primary:
            map['primary'] == null ? true : JsonClass.parseBool(map['primary']),
        resizeToAvoidBottomInset: map['resizeToAvoidBottomInset'] == null
            ? null
            : JsonClass.parseBool(map['resizeToAvoidBottomInset']),
        resizeToAvoidBottomPadding: map['resizeToAvoidBottomPadding'] == null
            ? null
            : JsonClass.parseBool(map['resizeToAvoidBottomPadding']),
      );
    }

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder childBuilder,
    BuildContext context,
    JsonWidgetData data,
    Key key,
  }) {
    assert(
      data.children?.isNotEmpty != true,
      '[JsonScaffoldBuilder] does not support children.',
    );

    return Scaffold(
      appBar: appBar?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      backgroundColor: backgroundColor,
      body: body?.build(childBuilder: childBuilder, context: context),
      bottomNavigationBar: bottomNavigationBar?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      bottomSheet: bottomSheet?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      drawer: drawer?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      drawerDragStartBehavior: drawerDragStartBehavior,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      drawerScrimColor: drawerScrimColor,
      endDrawer: endDrawer?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      floatingActionButton: floatingActionButton?.build(
        childBuilder: childBuilder,
        context: context,
      ),
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      floatingActionButtonLocation: floatingActionButtonLocation,
      persistentFooterButtons: persistentFooterButtons == null
          ? null
          : [
              for (var data in persistentFooterButtons)
                data.build(
                  childBuilder: childBuilder,
                  context: context,
                ),
            ],
      primary: primary,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
    );
  }
}
