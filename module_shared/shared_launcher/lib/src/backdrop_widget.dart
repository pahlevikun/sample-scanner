import 'package:flutter/widgets.dart';
import 'package:foundation_identifiers/foundation_identifiers.dart';

class RegisteredBackdropWidget {
  late final ProductIdentifier id;
  late final BackdropWidget widget;

  RegisteredBackdropWidget({
    required this.id,
    required this.widget,
  });
}

class BackdropWidget {
  late final BackdropWidgetIdentifier id;
  late final BackdropWidgetBuilder child;

  BackdropWidget(this.id, this.child);
}

typedef BackdropWidgetBuilder = Widget Function();
