# 7.0.0 Migration CLI

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Introduction](#introduction)
- [Usage](#usage)
- [Add dependency to pubspec:](#add-dependency-to-pubspec)
- [Run migration CLI](#run-migration-cli)
- [Breaking Changes supported by the CLI](#breaking-changes-supported-by-the-cli)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

---

## Introduction

The migration cli was introduced as part of the `7.0.0` release to assist with migrating existing templates from `v6` to `v7`.  Introduced with `v7` was multiple breaking changes required to get the code compatible with the code generator.  Those breaking changes can be a pain for developers so the migration cli was created to perform them automatically.

---

## Usage

## Add dependency to pubspec:

```yaml
dependencies:
  json_dynamic_widget: <version>
```

## Run migration CLI

```shell
dart run json_dynamic_widget:migrate_7 [path/to/files]
```

---

## Breaking Changes supported by the CLI

The following changes can be automatically fixed:
  * Both `child` and `children` have moved into the `args` for all widgets.
  * For `conditional` the `child` is no longer supported and must be in `args['onTrue']`.
  * For `scaffold` the `child` is no longer supported and must be in `args['body']`.
  * The values for `set_default_value` are no longer directly on the map and must be passed in with the key `values`.
  * The values for `set_value` are no longer directly on the map and must be passed in with the key `values`.
  * The values for `set_widget` are no longer directly on the map and must be passed in with the key `widgets`.
  * The `tween_animation` widget was renamed to the more correct `tween_animation_builder`.
  * The framework no longer auto-listens to changes.  To have a widget updated when an underlying value changes, the `listen` value must be provided to the widget.