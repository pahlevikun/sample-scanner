import 'package:fluro/fluro.dart';
import 'package:foundation_injector/foundation_injector.dart';

import 'index.dart';

import 'router_module.config.dart';

@module
abstract class RouterModule {
  @Singleton()
  FluroRouter provideFluroRouter() => FluroRouter();

  @Singleton()
  AppRouteRegistry provideInternalRouter(FluroRouter router) =>
      AppRouteRegistry(router);

  @Singleton()
  NavigationDispatcher provideNavigationDispatcher(AppRouteRegistry route) =>
      NavigationDispatcher(route.router);
}

@injectableInit
Future<void> configureRouterInjection() async => $initGetIt(Injector.instance);
