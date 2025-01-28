# DevTools extension
Adds a DevTools extension for the [json_dynamic_widget](https://pub.dev/packages/json_dynamic_widget) package.

## Functionality
Allows to edit the widget data in JSON or YAML format together with the preview of the built widget.

## Development
It is recommended to use Simulated DevTools Environment to develop this extension.

```
flutter run -d <web-device> --dart-define=use_simulated_environment=true
```

It gives the access to hot restart and a faster development cycle.


## Building
```
dart run devtools_extensions build_and_copy --source=. --dest=../json_dynamic_widget/extension/devtools
```