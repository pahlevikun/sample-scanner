part of 'navigation_dispatcher.dart';

mixin _HomeDispatcher {
  FluroRouter get _router;

  Future<dynamic> goToHome(BuildContext context) async {
    return _router.navigateTo(
      context,
      PathIdentifier.HOME,
      clearStack: true,
      transition: TransitionType.material,
    );
  }
}
