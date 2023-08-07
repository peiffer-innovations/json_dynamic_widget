#!/bin/sh

flutter clean && dart run build_runner build --delete-conflicting-outputs -v

pushd example
flutter clean && dart run build_runner build --delete-conflicting-outputs -v
popd
