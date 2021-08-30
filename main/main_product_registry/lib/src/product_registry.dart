import 'package:main_product_registry/src/product_menu_holder.dart';
import 'package:product_authentication/product_authentication.dart';
import 'package:product_prayer_times/product_prayer_times.dart';
import 'package:product_prayer_times/sheet_menu_tile_prayer_times.dart';
import 'package:product_splash/product_splash.dart';
import 'package:shared_launcher/shared_launcher.dart';

final List<Product> products = [
  MenuHolderProduct(),
  SplashProduct(),
  AuthenticationProduct(),
  PrayerTimesProduct(),
];

final List<BottomMenuTile> bottomMenuTiles = [
  PrayerTimesBottomMenuTile(),
];
final List<SheetMenuTile> sheetMenuTiles = [
  PrayerTimesSheetMenuTile(),
];
final List<RegisteredSheetWidget> sheetWidgets = [
  PrayerTimesSheetWidget(),
];
final List<RegisteredBackdropWidget> backdropWidgets = [
  PrayerTimesBackdropWidget(),
];
