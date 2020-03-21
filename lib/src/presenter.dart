import 'package:flutter/material.dart';

import 'view.dart';
import 'life_cycle.dart';

/// The base interface for a presenter (all presenter
/// interfaces should extend this).
abstract class IPresenter with ILifeCycle {
  /// Couples this [Presenter] with the given [View].
  void couple(covariant IView view);

  /// Decouples this [Presenter] from its associated [View].
  void decouple();
}

/// The presenter for the MVP pattern. It is the presenter's
/// job to update the associated view. Presenters handle all
/// of the logic that comes with interpreting the model (data)
/// to update the view.
class Presenter<V extends IView> implements IPresenter {
  V _view;

  /// The associated view interface
  V get view => _view;

  /// Returns whether this [Presenter] been coupled
  /// with a view.
  bool get isCoupled => view != null;

  @override
  void couple(V view) {
    assert(!isCoupled);
    this._view = view;
  }

  @override
  void decouple() {
    assert(isCoupled);
    this._view = null;
  }

  /// A [LifeCycle] initialization method (called only
  /// once, right before [start]). This presenter will
  /// already be coupled to the view when this is called.
  ///
  /// Within the flutter framework, this method is
  /// invoked when the associated view's [initState]
  /// method is called.
  @mustCallSuper
  @override
  void awake() {}

  /// A [LifeCycle] initialization method (called only
  /// once, right after [awake]).
  ///
  /// Within the flutter framework, this method is
  /// invoked after the associated view's [initState]
  /// call, but before the associated view's first call
  /// to [build].
  @mustCallSuper
  @override
  void start() {}

  /// A [LifeCycle] update method (called multiple times
  /// after the view has been initialized).
  ///
  /// Within the flutter framework, this method is
  /// invoked before the associated view's [build]
  /// method is called. That being said, changes
  /// to the view's state should not be called from
  /// this method.
  @mustCallSuper
  @override
  void update() {}

  /// A [LifeCycle] finalization method (called only
  /// once after [start] to 'finish' this presenter's job).
  /// This presenter will still be coupled to the view when
  /// this is called.
  ///
  /// Within the flutter framework, this method is
  /// invoked when the associated view's [dispose]
  /// method is called.
  @mustCallSuper
  @override
  void finish() {}
}
