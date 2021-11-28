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
