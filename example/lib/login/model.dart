/// This model code can be anything you want. I'm using
/// a singleton 'Service' to house all the business logic for
/// updating the model and a 'Model Object' to store the
/// data. But you can and should use whatever pattern you
/// want.
class AuthService {
  static final _instance = AuthService._();

  static AuthService get instance => _instance;

  UserModel loggedInUser;

  // A method to help update the model (in this case
  // setting the current user)
  Future<void> logIn({
    String username,
    String password,
  }) async {
    await Future.delayed(Duration(milliseconds: 500));

    loggedInUser = UserModel(
      username: username,
      password: password,
    );
  }

  AuthService._();
}

/// I.e. part of the 'model' of this application.
class UserModel {
  final String username;
  final String password;

  UserModel({
    this.username,
    this.password,
  });
}
