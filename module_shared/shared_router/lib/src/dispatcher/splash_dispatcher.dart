part of 'navigation_dispatcher.dart';

mixin _SplashDispatcher {
  FluroRouter get _router;

  Future<dynamic> goToSplash(BuildContext context) async {
    return _router.navigateTo(
      context,
      PathIdentifier.SPLASH,
      clearStack: true,
      transition: TransitionType.material,
    );
  }
}
