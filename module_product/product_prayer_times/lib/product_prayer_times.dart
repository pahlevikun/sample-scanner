library product_authentication;

import 'package:flutter/material.dart';
import 'package:foundation_identifiers/foundation_identifiers.dart';
import 'package:product_authentication/src/authentication_app.dart';
import 'package:shared_launcher/shared_launcher.dart';

export 'package:product_authentication/product_authentication.dart';
export 'package:product_prayer_times/backdrop_widget_prayer_times.dart';
export 'package:product_prayer_times/bottom_menu_tile_prayer_times.dart';
export 'package:product_prayer_times/sheet_menu_tile_prayer_times.dart';
export 'package:product_prayer_times/sheet_widget_prayer_times.dart';

class PrayerTimesProduct implements Product {
  @override
  ProductIdentifier productId = ProductIdentifier.PRAYER_TIMES;

  @override
  Map<PageIdentifier, RegisteredPage> registeredPages = {
    PageIdentifier.PRAYER_TIMES: RegisteredPage(
      PathIdentifier.PRAYER_TIMES,
      (args) => LoginApp(),
    ),
  };

  @override
  RegisteredPage defaultPage = RegisteredPage(
    PathIdentifier.PRAYER_TIMES,
    (args) => LoginApp(),
  );

  @override
  Future<void> onConfigureDependencies() async {}

  @override
  void onBuild(BuildContext context) {}
}
