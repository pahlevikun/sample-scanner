part of 'app_route_registry.dart';

mixin _HomeRegistry {
  void _registerRoute(RegisteredPage page);

  void _initHomeRoutes() {
    products
        .firstWhere(
            (element) => element.productId == ProductIdentifier.MENU_HOLDER)
        .registeredPages
        .forEach((key, value) {
      _registerRoute(value);
    });
  }
}
