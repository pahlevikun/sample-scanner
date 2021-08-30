import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:foundation_identifiers/foundation_identifiers.dart';

part 'authentication_dispatcher.dart';

part 'home_dispatcher.dart';

part 'splash_dispatcher.dart';

class NavigationDispatcher
    with _HomeDispatcher, _AuthenticationDispatcher, _SplashDispatcher {
  final FluroRouter _router;

  NavigationDispatcher(this._router);

  Future<void> back(context, {dynamic result}) async {
    _router.pop(context, result);
  }
}
