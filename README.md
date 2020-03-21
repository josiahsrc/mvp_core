# mvp_core

An MVP (model/view/presenter) framework for applications 
written in dart. This package gives specific support to
the flutter framework.


## Getting Started

The following code is a stubbed out tutorial of how to use this
package. See the `lib/examples` directory in the repository of this
package for a more completed example. You can find the repository
[here](https://github.com/HatFeather/mvp_core).

<b>Create the presenter (and the interfaces it expects).</b> 
I recommend placing these 3 classes in the same file because 
they are all closely related to eachother.

~~~~
/// The interface the presenter will use to communicate with the view.
abstract class IMyView extends IView { ... }

/// The interface the view will use to communicate with the presenter.
abstract class IMyPresenter extends IPresenter { ... }

/// The concrete presenter which updates the view and the model.
class MyPresenter extends Presenter<IMyView> implements IMyPresenter { ... }
~~~~


<b>Create the view (using the interfaces the presenter 
expects).</b> I again recommend placing these classes
in the same file because they are closesly related to
each other.

~~~~
/// Since the presenter updates the view's state,
/// the view should be a [StatefulWidget].
class MyPage extends StatefulWidget {
    @override
    _MyPageState createState() => _MyPageState();
}

/// The concrete view which the presenter updates. The view depends 
/// on the presenter and implements the interfaces it expects
class _MyPageState extends StateView<MyPage, IMyPresenter> implements IMyView {

    /// Builds the UI for the view just like any
    /// other flutter stateful widget.
    @override
    Widget build(BuildContext context) { ... }

    /// Create the presenter which will update this view.
    ///
    /// This is the only place where the concrete presenter
    /// should be referenced in the view.
    @override
    IMyPresenter createPresenter() => MyPresenter();
}
~~~~

## Purpose

### Weak coupling
This package attempts to create a weak coupling between
views and presenters in flutter applications. This means 
that views only know about the interfaces of their
associated presenters and presenters only know about the 
interfaces of their associated views.

### Automated testing
Because of weak coupling, automatically testing an application
becomes trivial. See [Testing](#Testing).

### No assumptions about the model
This package makes no assumptions about the model of your
application. This means that any model (or data) you choose
(as well as whatever model pattern) will work with this
framework.


## Testing 

> "The MVP pattern is a variation of the MVC pattern that 
> results in more testable code." - Ken Rodham

Since the coupling between the views and the presenters
is strictly through interfaces, it's easy to create a `MockView`
to test the presenter. See the `examples` directory of this
package's repository for examples of how to do this.

To test the widgets, you can simply perform the same `widget-tests` 
that you would perform in any other application.
