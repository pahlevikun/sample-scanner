part of 'app_route_registry.dart';

mixin _AuthenticationRegistry {
  void _registerRoute(RegisteredPage page);

  void _initAuthenticationRoutes() {
    products
        .firstWhere(
            (element) => element.productId == ProductIdentifier.AUTHENTICATION)
        .registeredPages
        .forEach((key, value) {
      _registerRoute(value);
    });
  }
}
