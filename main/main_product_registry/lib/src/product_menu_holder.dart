library product_menu_holder;

import 'package:flutter/material.dart';
import 'package:foundation_identifiers/foundation_identifiers.dart';
import 'package:foundation_injector/foundation_injector.dart';
import 'package:main_product_registry/src/presentation/home.dart';
import 'package:shared_launcher/shared_launcher.dart';

import 'product_menu_holder.config.dart';

class MenuHolderProduct implements Product {
  @override
  ProductIdentifier productId = ProductIdentifier.MENU_HOLDER;

  @override
  Map<PageIdentifier, RegisteredPage> registeredPages = {
    PageIdentifier.HOME: RegisteredPage(
      PathIdentifier.HOME,
      (args) => HomePage(),
    )
  };

  @override
  RegisteredPage defaultPage = RegisteredPage(
    PathIdentifier.HOME,
    (args) => HomePage(),
  );

  @override
  Future<void> onConfigureDependencies() async {
    await configureMenuHolderAppInjection();
  }

  @override
  void onBuild(BuildContext context) {}
}

@injectableInit
Future<void> configureMenuHolderAppInjection() async =>
    $initGetIt(Injector.instance);
