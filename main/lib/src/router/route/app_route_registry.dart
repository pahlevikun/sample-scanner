import 'package:Scanner/src/index.dart';
import 'package:fluro/fluro.dart';

class AppRouteRegistry {
  final FluroRouter router;

  AppRouteRegistry(this.router);

  void initRouter() {
    router.define(
      PathIdentifiers.SPLASH,
      transitionType: TransitionType.material,
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> parameters) {
          return SplashPage();
        },
      ),
    );
    router.define(
      PathIdentifiers.HOME,
      transitionType: TransitionType.material,
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> parameters) {
          return HomePage();
        },
      ),
    );
    router.define(
      PathIdentifiers.FORM,
      transitionType: TransitionType.material,
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> parameters) {
          return UserFormPage();
        },
      ),
    );
  }
}
