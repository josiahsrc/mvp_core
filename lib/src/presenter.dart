import 'package:flutter/material.dart';

import 'view.dart';
import 'life_cycle.dart';

abstract class IPresenter with ILifeCycle {}

class Presenter<V extends IView> implements ILifeCycle {
  V _view;

  V get view => _view;

  bool get isBinded => view != null;

  void bind(V view) {
    assert(!isBinded);
    this._view = view;
  }

  void unbind() {
    assert(isBinded);
    this._view = null;
  }

  @mustCallSuper
  @override
  void awake() {}

  @mustCallSuper
  @override
  void start() {}

  @mustCallSuper
  @override
  void update() {}

  @mustCallSuper
  @override
  void finish() {}
}
