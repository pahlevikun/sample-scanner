library product_splash;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foundation_identifiers/foundation_identifiers.dart';
import 'package:foundation_injector/foundation_injector.dart';
import 'package:product_splash/src/presentation/splash.dart';
import 'package:shared_launcher/shared_launcher.dart';

import 'product_splash.config.dart';

export 'package:product_splash/product_splash.dart';

class SplashProduct implements Product {
  @override
  ProductIdentifier productId = ProductIdentifier.SPLASH;

  @override
  Map<PageIdentifier, RegisteredPage> registeredPages = {
    PageIdentifier.SPLASH: RegisteredPage(
      PathIdentifier.SPLASH,
      (args) => SplashPage(),
    )
  };

  @override
  RegisteredPage defaultPage = RegisteredPage(
    PathIdentifier.SPLASH,
    (args) => SplashPage(),
  );

  @override
  Future<void> onConfigureDependencies() async {
    await configureSplashAppInjection();
  }

  @override
  void onBuild(BuildContext context) {}
}

@injectableInit
Future<void> configureSplashAppInjection() async =>
    $initGetIt(Injector.instance);
