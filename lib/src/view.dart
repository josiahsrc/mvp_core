import 'package:flutter/material.dart';

import 'presenter.dart';
import 'life_cycle.dart';

abstract class IView {}

abstract class View<P extends IPresenter> implements ILifeCycle {
  P get presenter;

  @mustCallSuper
  @override
  void awake() {
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
  }
}

abstract class StateView<T extends StatefulWidget, P extends IPresenter>
    extends State<T> with View<P> {
  bool _initialized;
  P _presenter;

  bool get initialized => _initialized ?? false;

  @override
  P get presenter => _presenter;

  @override
  void initState() {
    super.initState();

    this._presenter = bindPresenter();
    super.awake();
  }

  @override
  void dispose() {
    super.finish();
    super.dispose();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!_initialized) {
      super.start();
      _initialized = true;
    }

    super.update();
  }

  P bindPresenter();
}
