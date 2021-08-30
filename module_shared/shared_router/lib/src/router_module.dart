import 'package:shared_router/shared_router.dart';
import 'package:fluro/fluro.dart';
import 'package:injectable/injectable.dart';

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
