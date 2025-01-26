# DevTools extension for json-dynamic-widget

## Functionalities ToDo
- [ ] Display registry variables
- [ ] Show original JSON as written
- [ ] Show processed JSON after template processing

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