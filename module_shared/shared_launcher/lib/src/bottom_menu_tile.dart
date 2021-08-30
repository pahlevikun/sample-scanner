import 'package:flutter/widgets.dart';
import 'package:foundation_identifiers/foundation_identifiers.dart';

abstract class BottomMenuTile {
  late final ProductIdentifier productId;

  late final String pagePath;

  late final Image menuIcon;

  late final String menuTitle;
}
