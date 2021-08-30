import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foundation_identifiers/foundation_identifiers.dart';
import 'package:main_product_registry/main_product_registry.dart';
import 'package:shared_launcher/shared_launcher.dart';

part 'authentication_registry.dart';

part 'home_registry.dart';

part 'splash_registry.dart';

class AppRouteRegistry
    with _AuthenticationRegistry, _SplashRegistry, _HomeRegistry {
  final FluroRouter router;

  AppRouteRegistry(this.router);

  initRouter() {
    _initSplashRoutes();
    _initAuthenticationRoutes();
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
