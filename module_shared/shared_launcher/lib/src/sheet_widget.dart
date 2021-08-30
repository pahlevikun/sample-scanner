import 'package:flutter/widgets.dart';
import 'package:foundation_identifiers/foundation_identifiers.dart';

class RegisteredSheetWidget {
  late final ProductIdentifier id;
  late final SheetWidget widget;

  RegisteredSheetWidget({
    required this.id,
    required this.widget,
  });
}

class SheetWidget {
  late final SheetWidgetIdentifier id;
  late final SheetWidgetBuilder child;

  SheetWidget(this.id, this.child);
}

typedef SheetWidgetBuilder = Widget Function();
