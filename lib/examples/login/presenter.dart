// The presenter makes no assumptions of the view,
// so there should be no dependencies on view specific
// code.

import 'package:mvp_core/mvp_core.dart';

// The presenter should update the model (so
// there should be a dependency on the model)
import 'model.dart';

/// The interface the presenter uses to communicate with the view
abstract class ILoginView extends IView {
  String get username;
  String get password;

  set isLoadingBarShown(bool value);

  void showError(String message);
}

/// The interface the view uses to communicate with the presenter
abstract class ILoginPresenter extends IPresenter {
  Future<void> tryToLogin();
}

/// This is the concrete presenter, it carries out all the logic
/// needed to update the view (i.e. updates the view to match the
/// model.
///
/// NOTE: The presenter extends the base [Presenter] class to
/// obtain all of its functionality and also implements it's
/// own [ILoginPresenter] interface which the view can use to
/// communicate with the presenter.
class LoginPresenter extends Presenter<ILoginView> implements ILoginPresenter {
  /// The view calls this method to update the model
  @override
  Future<void> tryToLogin() async {
    view.isLoadingBarShown = true;

    // Attempts to update the model by "signing in" the current
    // user and setting that signed in user as the user of this
    // application.
    try {
      // Using info from the view to login (username and password
      // that the user entered).
      await AuthService.instance.logIn(
        username: view.username,
        password: view.password,
      );
    } catch (e) {
      // Tell the view to show an error message when login fails
      view.showError(e);
    }

    view.isLoadingBarShown = false;
  }
}
