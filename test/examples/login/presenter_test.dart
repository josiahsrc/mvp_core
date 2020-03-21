import 'package:flutter_test/flutter_test.dart';
import 'package:mvp_core/examples/login/model.dart';
import 'package:mvp_core/examples/login/presenter.dart';
import 'package:mvp_core/mvp_core.dart';

class MockLoginPage extends View<ILoginPresenter> implements ILoginView {
  bool isLoading;
  String errMessage;

  @override
  set isLoadingBarShown(bool value) => isLoading = value;

  @override
  void showError(String message) => errMessage = message;

  @override
  String get username => 'test';

  @override
  String get password => 'test';

  @override
  ILoginPresenter get presenter => LoginPresenter();
}

/// An example of a presenter test using a mock view
void main() {
  test('Presenter should log in the user', () async {
    // TODO make a generic presenter runner
    // TODO for testing so lifecycle calls
    // TODO aren't needed.

    final page = MockLoginPage();
    page.awake();
    page.start();
    page.update();

    // Simulate the page calling [tryToLogin] on the
    // presenter.
    await page.presenter.tryToLogin();

    // Make sure the model was updated (i.e. in this
    // case that the user signed in).
    final user = AuthService.instance.loggedInUser;
    expect(user.username, page.username);
    expect(user.password, page.password);

    // No errors should have been shown
    expect(page.errMessage, null);

    page.finish();
  });
}
