import 'package:flutter/material.dart';

import 'view.dart';
import 'life_cycle.dart';

abstract class IPresenter with ILifeCycle {
  void bind(covariant IView view);
  void unbind();
}

class Presenter<V extends IView> implements IPresenter {
  V _view;

  V get view => _view;
  bool get isBinded => view != null;

  @override
  void bind(V view) {
    assert(!isBinded);
    this._view = view;
  }

  @override
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
