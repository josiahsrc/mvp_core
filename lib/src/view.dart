import 'package:flutter/material.dart';

import 'presenter.dart';
import 'life_cycle.dart';

/// The base interface for a view (all view interfaces
/// should extend this).
abstract class IView with ILifeCycle {}

/// The view for the MVP pattern.
///
/// A generic view implmentation which appropriately
/// syncs the lifecycle of the associated [Presenter]
/// with the view. The associated [Presenter] should
/// update this view to sync with the model (data) of
/// the app.
///
/// This is not flutter specific. Use [StateView] instead
/// for an MVP pattern specific to the flutter framework.
abstract class View<P extends IPresenter> implements IView {
  /// The associated presenter interface.
  P get presenter;

  @mustCallSuper
  @override
  void awake() {
    this.presenter.couple(this);
    this.presenter.awake();
  }

  @mustCallSuper
  @override
  void start() {
    this.presenter.start();
  }

  @mustCallSuper
  @override
  void update() {
    this.presenter.update();
  }

  @mustCallSuper
  @override
  void finish() {
    this.presenter.finish();
    this.presenter.decouple();
  }
}

/// A view base class which is specific to the flutter
/// framework. All MVP patterned views should extend this.
abstract class StateView<T extends StatefulWidget, P extends IPresenter>
    extends State<T> with View<P> {
  bool _initialized;
  P _presenter;

  /// Returns whether this [StateView] has initialized
  /// itself or not. A [StateView] becomes initialized
  /// after [initState] and before the first [build]
  /// call.
  bool get initialized => _initialized ?? false;

  @override
  P get presenter => _presenter;

  @override
  void initState() {
    super.initState();

    this._presenter = createPresenter();
    super.awake();
  }

  @override
  void dispose() {
    super.finish();
    this._presenter = null;

    super.dispose();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!_initialized) {
      super.start();
      this._initialized = true;
    }

    super.update();
  }

  /// Invoked when [initState] is called and after
  /// the associated presenter was binded to this view.
  @override
  void awake() {
    super.awake();
  }

  /// Invoked after [initState] is called and right
  /// before the first [build] call.
  @override
  void start() {
    super.start();
  }

  /// Invoked before every [build] call.
  @override
  void update() {
    super.update();
  }

  /// Invoked when [dispose] is called.
  @override
  void finish() {
    super.finish();
  }

  /// Instantiates the associated presenter (which
  /// is soon after binded to this view).
  P createPresenter();
}
