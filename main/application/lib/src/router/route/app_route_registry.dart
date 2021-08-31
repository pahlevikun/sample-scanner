import 'package:Pomodoro/src/index.dart';
import 'package:fluro/fluro.dart';

part 'home_registry.dart';

class AppRouteRegistry
    with _HomeRegistry {
  final FluroRouter router;

  AppRouteRegistry(this.router);

  initRouter() {
    _initHomeRoutes();
  }

  void _registerRoute(RegisteredPage page) {
    router.define(
      page.path,
      transitionType: TransitionType.material,
      handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> parameters) {
          return page.registerPage(parameters);
        },
      ),
    );
  }
}
