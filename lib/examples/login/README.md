# Basic Example

This example demonstrates how to use the MVP pattern with
a simple mocked-login sample.

## model.dart

This file has all code related to the model of the app

## presenter.dart

This file has all code related to the presenter of the app.
The interfaces for the view interface, presenter interface,
and concrete presenter should be in here. This file should
have a dependency on the model but no dependency on the view
(it should only communicate with the view through interfaces).

## view.dart

This file has all code related to the view of the app. The
flutter widget should be in here. This should depend on
the `presenter.dart` file (because it has to implement
the interfaces it specifies). The view should only communicate 
with the presenter through the presenter interface.