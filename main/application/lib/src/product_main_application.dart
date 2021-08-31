library product_menu_holder;

import 'index.dart';

class MainApplicationProduct implements Product {
  @override
  ProductIdentifier productId = ProductIdentifier.MAIN_APPLICATION;

  @override
  Map<PageIdentifier, RegisteredPage> registeredPages = {
    PageIdentifier.SPLASH: RegisteredPage(
      PathIdentifier.SPLASH,
      (args) => SplashPage(),
    ),
    PageIdentifier.HOME: RegisteredPage(
      PathIdentifier.HOME,
      (args) => HomePage(),
    )
  };

  @override
  RegisteredPage defaultPage = RegisteredPage(
    PathIdentifier.SPLASH,
    (args) => SplashPage(),
  );

  @override
  Future<void> onConfigureDependencies() async {
    await configureMainApplicationInjection();
  }

  @override
  void onBuild(BuildContext context) {}
}

@injectableInit
Future<void> configureMainApplicationInjection() async =>
    $initGetIt(Injector.instance);
