import 'package:flutter/material.dart';
import 'package:foundation_identifiers/foundation_identifiers.dart';
import 'package:shared_launcher/shared_launcher.dart';
import 'package:shared_manifest/manifest.dart';

class PrayerTimesBottomMenuTile implements BottomMenuTile {
  @override
  ProductIdentifier productId = ProductIdentifier.PRAYER_TIMES;

  @override
  Image menuIcon = Image(image: ImageManifest.lanscape);

  @override
  String menuTitle = "Prayer Times";

  @override
  String pagePath = PathIdentifier.PRAYER_TIMES;
}
