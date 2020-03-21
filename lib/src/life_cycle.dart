/// A life cycle scaffold for consistency
/// in the MVP pattern.
abstract class ILifeCycle {
  /// Initializer method which is invoked once before [start].
  void awake();

  /// Initializer method which is invoked once after [awake].
  void start();

  /// Update method which is invoked many times after [start].
  void update();

  /// Finalization method which is invoked once after [start].
  void finish();
}
