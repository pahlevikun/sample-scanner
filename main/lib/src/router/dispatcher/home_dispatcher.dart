part of 'navigation_dispatcher.dart';

mixin _HomeDispatcher {
  FluroRouter get _router;

  Future<dynamic> goToHome(BuildContext context) async {
    return _router.navigateTo(
      context,
      PathIdentifiers.HOME,
      clearStack: true,
      transition: TransitionType.native,
    );
  }

  Future<dynamic> goToForm(BuildContext context) async {
    return _router.navigateTo(
      context,
      PathIdentifiers.HOME,
      clearStack: true,
      transition: TransitionType.native,
    );
  }
}
