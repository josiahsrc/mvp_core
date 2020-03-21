import 'package:flutter/material.dart';

import 'presenter.dart';
import 'life_cycle.dart';

abstract class IView with ILifeCycle {}

abstract class View<P extends IPresenter> implements IView {
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

    this._presenter = createPresenter();
    this._presenter.bind(this);
    super.awake();
  }

  @override
  void dispose() {
    super.finish();
    this._presenter.unbind();
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

  P createPresenter();
}
