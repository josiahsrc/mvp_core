import 'package:mvp_core/mvp_core.dart';

/// The interface the presenter uses to communicate with the view
abstract class ILoginView extends IView {}

/// The interface the view uses to communicate with the presenter
abstract class ILoginPresenter extends IPresenter {}

/// This is the presenter, it carries out all the logic needed to
/// update the view (it interprets the model)
class LoginPresenter {
  
}
