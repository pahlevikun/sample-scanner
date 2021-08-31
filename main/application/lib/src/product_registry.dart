import 'package:Pomodoro/src/product_main_application.dart';
import 'package:shared_launcher/shared_launcher.dart';

final Product mainProduct = MainApplicationProduct();

final List<Product> products = [
  mainProduct,
];

final List<BottomMenuTile> bottomMenuTiles = [];
final List<RegisteredSheetWidget> sheetWidgets = [];
final List<RegisteredBackdropWidget> backdropWidgets = [];
