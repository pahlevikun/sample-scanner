part of 'app_route_registry.dart';

mixin _SplashRegistry {

  void _registerRoute(RegisteredPage page);


  void _initSplashRoutes() {
    products
        .firstWhere((element) => element.productId == ProductIdentifier.SPLASH)
        .registeredPages
        .forEach((key, value) {
      _registerRoute(value);
    });
  }
}
