import 'package:flutter/material.dart';
import 'package:mvp_core/mvp_core.dart';

// A dependency on the presenter, because the view
// needs to explicitly link itself to the presenter.
import 'presenter.dart';

/// Your basic stateful widget
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

/// The concrete view for the MVP pattern.
///
/// Notice here that the view only depends on the interface
/// of the presenter [ILoginPresenter].
///
/// The flutter view should extend [StateView] with the
/// presenter that should manage this view passed as a
/// generic parameter (in this case [ILoginPresenter]) and
/// should implement the view interface that the associated
/// [Presenter] expects (in this case [ILoginView])
class _LoginPageState extends StateView<LoginPage, ILoginPresenter>
    implements ILoginView {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    // display the loading container only
    // if the view is loading (as the presenter
    // told it to).
    final loadingContainer = _isLoading
        ? SizedBox.fromSize(
            size: Size.square(16),
            child: CircularProgressIndicator(),
          )
        : Container();

    return Scaffold(
      body: Column(
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          loadingContainer,
        ],
      ),
    );
  }

  // Use this function to create the presenter.
  @override
  ILoginPresenter createPresenter() {
    return LoginPresenter();
  }

  // All the code below this point is called by the presenter.
  // This demonstrates how the presenter is used to update the view.
  @override
  set isLoadingBarShown(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  @override
  void showError(String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  String get password => _usernameController.value.text;

  @override
  String get username => _usernameController.value.text;
}
