## [5.1.6+1] - December 13, 2022

* Automated dependency updates


## [5.1.6] - December 10th, 2022

* Fixed text input self-subscribing to change events: [Issue 109](https://github.com/peiffer-innovations/json_dynamic_widget/issues/109)


## [5.1.5] - December 10th, 2022

* Fixed `labelStyle` arg of input_decorator decoder


## [5.1.4] - December 1, 2022

* Fixed `transform` arg of Container builder


## [5.1.3+5] - November 22, 2022

* Automated dependency updates


## [5.1.3+4] - November 15, 2022

* Automated dependency updates


## [5.1.3+3] - November 8, 2022

* Automated dependency updates


## [5.1.3+2] - November 1, 2022

* Automated dependency updates


## [5.1.3+1] - October 25, 2022

* Automated dependency updates


## [5.1.3] - October 17, 2022

* Fixed value type of radio
* Added radio.json example

## [5.1.2+7] - October 18, 2022

* Automated dependency updates

## [5.1.2+6] - October 11, 2022

* Automated dependency updates


## [5.1.2+5] - September 27, 2022

* Automated dependency updates


## [5.1.2+4] - September 20, 2022

* Automated dependency updates


## [5.1.2+3] - September 13, 2022

* Automated dependency updates


## [5.1.2+2] - September 6, 2022

* Automated dependency updates


## [5.1.2+1] - August 30, 2022

* Automated dependency updates


## [5.1.2] - August 24th, 2022

* Added the possibility to select internal builders thanks to `overrideInternalBuilders` flag

## [5.1.1] - August 20th, 2022

* Added the possibility to select internal functions thanks to `overrideInternalFunctions` flag

## [5.1.0+1] - August 16, 2022

* Automated dependency updates

## [5.1.0] - August 11th, 2022

* Preparing for Flutter 3.3


## [5.0.3+4] - August 9, 2022

* Automated dependency updates


## [5.0.3+3] - August 2, 2022

* Automated dependency updates


## [5.0.3+2] - July 26, 2022

* Automated dependency updates


## [5.0.3+1] - July 25th, 2022

* Added YAML support with an example


## [5.0.2+5] - July 19, 2022

* Automated dependency updates


## [5.0.2+4] - July 12, 2022

* Automated dependency updates


## [5.0.2+3] - July 5, 2022

* Automated dependency updates


## [5.0.2+2] - June 28, 2022

* Automated dependency updates


## [5.0.2+1] - June 21, 2022

* Automated dependency updates


## [5.0.2] - June 15, 2022

* Refactored all builders to a separate `builders` export from the main export.


## [5.0.1+1] - June, 14, 2022

* Automated dependency updates


## [5.0.1] - June, 13, 2022

* Fixing #58 - log function


## [5.0.0+2] - June, 7, 2022

* Automated dependency updates


## [5.0.0+1] - May, 31, 2022

* Automated dependency updates


## [5.0.0] - May 14th, 2022

* Flutter 3.0


## [4.1.1+1] - April 5th, 2022

* Fixed overridden template parser
* Fix for [Issue #51](https://github.com/peiffer-innovations/json_dynamic_widget/issues/51)


## [4.1.0+1] - March 27th, 2022

* Fixed missing schemas for `Measured` and `LayoutBuilder`
* Swapped from [expressions](https://pub.dev/packages/expressions) to [template_expressions](https://pub.dev/packages/template_expressions) to provide more functionality for expressions.


## [4.0.1+2] - February 20th, 2022

* Formatting changes


## [4.0.1+1] - February 6th, 2022

* Flutter 2.10


## [4.0.0] - January 22nd, 2022

* **BREAKING**: Introduction of the new JSON syntax which integrates strongly [expressions](https://pub.dev/packages/expressions) library
* Huge thanks to [crisperit](https://github.com/crisperit) for this release


## [3.6.0+3] - January 9th, 2022

* Dependency updates


## [3.6.0] - December 31st, 2021

* Added new `comment` option to allow for human readable comments to be placed in the JSON tree.
* Added `PrimaryScrollController`, `Scrollbar`, `ScrollConfiguration`
* Added `SliverPadding`
* Added new `set_scroll_controller` option to create and place a `ScrollController` on the registry.


## [3.5.3] - December 29th, 2021

* Added `SliverToBoxAdapter`, `SliverList`, `SliverGrid` and `CustomScrollView`


## [3.5.2] - December 19th, 2021

* Added ability to escape commas in function args


## [3.5.1] - December 14th, 2021

* Added ability to use named args in parameters like: `##setItems(key:keyName, items:{{myItems}})##`


## [3.5.0] - December 12th, 2021

* Updates for Flutter 2.8
* Fixes for when a function is used as a `child`
* Fixed value notifications when values are a collection and matches current


## [3.4.2+1] - December 3rd, 2021

* Minor fix on the function expression parser
* Redefined `JsonWidgetFunction` to return `dynamic` rather than `FutureOr<dynamic>` as futures actually never worked


## [3.4.1] - December 2nd, 2021

* Added ability to get the map of registered functions


## [3.4.0+2] - November 30th, 2021

* Added ability for `JsonDynamicWidget` to be able to parse a JSON string
* Added `length` function
* Added `JsonSetDefaultValueBuilder` to be able to set values if, and only if, the value is not already set on the registry
* Added `JsonTooltipBuilder`, `JsonWrapBuilder`, and `JsonGridViewBuilder`
* Greatly improved error messaging


## [3.3.0+1] - November 28th, 2021

* Added `for_each` iterator function
* Fixed `theme.json` example


## [3.2.0+1] - November 20th, 2021

* Added ability to get data from a variable via JSON Path


## [3.1.1+1] - November 13th, 2021

* Minor error reporting enhancements
* Dependency updates


## [3.1.0] - October, 10th 2021

* The modification of the value which lies under `id` key of `JsonWidgetRegistry` for `JsonTextFormFieldBuilder` will change the value in `TextFormField`.
* Added missing `remove` for `JsonDynamicBuilder`.
* Allow for empty values in function params.
* Fixed the invalid dialog closing in `dynamic.json` page after submitting the dialog form.


## [3.0.0] - September, 19th 2021

* Updated to Flutter 2.5
* Added `clip_path`, `measured`, `layout_builder`, `testable` as newly supported widgets.
* Fix for issue #30
* Began support for automated tests


## [2.2.0] - August, 23nd 2021

* Added `dynamic` builder type and `dynamic` function.


## [2.1.0] - June, 2nd 2021

* **BREAKING**: Completely refactored how `ElevatedButton`, `OutlinedButton`, and `TextButton` work with the style attribute.
* Added support for `Semantics`, `MergeSemantics`, and `ExcludeSemantics`.


## [2.0.0] - March, 8th 2021

* Null Safety


## [1.4.1] - February, 6th 2021

* Added support for `IconButton`.


## [1.4.0+1] - December 26th, 2020

* Ignore deprecated Flat / Raised button errors so the framework can continue to support them.


## [1.4.0] - December 26th, 2020

* Added in the concept of `static` vs `dynamic` variables; earlier all were always `dynamic`.
* Updated to be more forgiving on widget children requirements.
* Updated to use all `id` values on the base widgets as the value for a `ValueKey`.
* **BREAKING**: Moved the `id` entry for `radio` from the base widget to the `args`.


## [1.3.0] - December 13th, 2020

* Updated dependencies


## [1.2.2] - December 13th, 2020

* Removed "isMaterialAppTheme" as it was removed in Flutter 1.25.


## [1.2.1+1] - November 26th, 2020

* Added `$comment` with links to the dartdocs for each supported schema.


## [1.2.1] - November 24th, 2020

* Minor updates to ensure every widget has an id.
* Better handling of building with variable references that are inlined.


## [1.2.0+2] - November 22nd, 2020

* Minor refator to allow easy access to all supported widget's schemas.


## [1.2.0+1] - November 22nd, 2020

* Added example alternative to reported [Issue #20](https://github.com/peiffer-innovations/json_dynamic_widget/issues/20).


## [1.2.0] - October 29th, 2020

* Added support for widgets from Flutter 1.22 and previous versions: `ElevatedButton`, `FloatingActionButton`, `FractionalTranslation`, `FractionallySizedBox`, `InteractiveViewer`, `IntrinsicHeight`, `IntrinsicWidth`, `LimitedBox`, `Offstage`, `OutlinedButton`, `OverflowBox`, `Placeholder`, `PopupMenuButton` and `TextButton`.


## [1.1.3] - October 21st, 2020

* Updated with attributes from Flutter 1.22


## [1.1.2] - September 22nd, 2020

* Upgraded to latest `json_theme` before the next Flutter release breaks us


## [1.1.1] - September 11th, 2020

* Added example for `linux`


## [1.1.0] - September 4th, 2020

* Added all `ImplicitlyAnimatedWidget` widgets support.
* Added `Directionality` widget support.


## [1.0.6] - September 1st, 2020

* Updated `json_theme` version because Flutter 1.21 was going to break things
* Added example for `macos`
* Added example for `web`


## [1.0.5] - September 1st, 2020

* Updated `json_theme` version to fix issues #12.


## [1.0.4] - August 30th, 2020

* Updated `json_theme` version to fix issues #10 and #11.


## [1.0.3] - August 23nd, 2020

* Added `ClipOval` support
* Added `DecoratedBox` support
* Update the `json_theme` version to ^1.2.3


## [1.0.2] - August 22nd, 2020

* Dependency updates


## [1.0.1+1] - August 22nd, 2020

* Updates to the example app only


## [1.0.1] - August 6th, 2020

* Updated with attributes from Flutter 1.20.0


## [1.0.0+1] - July 28th, 2020

* Fixed some minor typos in the README file.


## [1.0.0] - July 19th, 2020

* Real release with completed examples and documentation


## [0.9.9] - July 18th, 2020

* Initial release

























