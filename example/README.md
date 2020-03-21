# MVP Example

This example demonstrates how to use the MVP pattern with
a simple mocked-login sample.

## Structure

The example for the model, view, and presenter code is
all housed within the `lib/login` directory. An example
of how to test this code is housed in the `test/login`
directory.

Please note that the layout of this code is just an example. 
A more appropriate structure might be:

```
lib/
    model/
        services/
            auth_service.dart
        domain/
            user_model.dart
    presenter/
        login_presenter.dart
    view/
        login_view.dart
```

## File purposes

### lib/login/model.dart

This file has all code related to the model of the app

### lib/login/presenter.dart

This file has all code related to the presenter of the app.
The interfaces for the view interface, presenter interface,
and concrete presenter should be in here. This file should
have a dependency on the model but no dependency on the view
(it should only communicate with the view through interfaces).

### lib/login/view.dart

This file has all code related to the view of the app. The
flutter widget should be in here. This should depend on
the `presenter.dart` file (because it has to implement
the interfaces it specifies). The view should only communicate 
with the presenter through the presenter interface.

### test/login/presenter_test.dart

This file shows how to test a presenter using MockViews.