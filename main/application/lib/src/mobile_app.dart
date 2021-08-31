library mobile_app;

import 'package:alice/alice.dart';

import 'index.dart';

Future<void> configureMobileApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  try {
    await configureDependencies();
    runApp(MobileApp());
  } catch (error) {
    Logger.debug('Setup has been failed before starting app >> $error');
  }
}

Future<void> configureDependencies() async {
  await configureAuthTokenInjection();
  await configureEventInjection();
  await configureRouterInjection();
  await configureNetworkInjection();
  products.forEach((element) async {
    await element.onConfigureDependencies();
  });
}

class MobileApp extends StatefulWidget {
  @override
  _MobileAppState createState() => _MobileAppState();
}

class _MobileAppState extends State<MobileApp> {
  final _alice = Injector.instance<Alice>();
  final _route = Injector.instance<AppRouteRegistry>();

  @override
  Widget build(BuildContext context) {
    _initOnBuild(context);
    return MaterialApp(
      debugShowCheckedModeBanner: BuildConfig.DEBUG,
      navigatorKey: _alice.getNavigatorKey(),
      home: mainProduct.defaultPage.registerPage({}),
      onGenerateRoute: _route.router.generator,
    );
  }

  void _initOnBuild(BuildContext context) {
    _route.initRouter();
    products.forEach((element) {
      element.onBuild(context);
    });
  }
}
