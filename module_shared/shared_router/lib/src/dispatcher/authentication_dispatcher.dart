part of 'navigation_dispatcher.dart';

mixin _AuthenticationDispatcher {
  FluroRouter get _router;

  Future<dynamic> goToLogin(BuildContext context) async {
    return _router.navigateTo(
      context,
      PathIdentifier.LOGIN,
      transition: TransitionType.material,
    );
  }
}
