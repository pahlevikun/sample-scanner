import 'package:Pomodoro/src/index.dart';
import 'package:fluro/fluro.dart';

part 'home_dispatcher.dart';

class NavigationDispatcher with _HomeDispatcher {
  final FluroRouter _router;

  NavigationDispatcher(this._router);

  Future<void> back(context, {dynamic result}) async {
    _router.pop(context, result);
  }
}
