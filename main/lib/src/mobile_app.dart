library mobile_app;

import 'index.dart';

Future<void> configureMobileApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  try {
    await configureAppComponent();
    runApp(MobileApp());
  } catch (error) {
    Logger.debug('Setup has been failed before starting app >> $error');
  }
}

class MobileApp extends StatefulWidget {
  @override
  _MobileAppState createState() => _MobileAppState();
}

class _MobileAppState extends State<MobileApp> {
  final _route = Injector.instance<AppRouteRegistry>();

  @override
  Widget build(BuildContext context) {
    _initOnBuild(context);
    return MaterialApp(
      color: ColorManifest.PRIMARY.toColor(),
      initialRoute: PathIdentifiers.SPLASH,
      debugShowCheckedModeBanner: BuildConfig.DEBUG,
      onGenerateRoute: _route.router.generator,
    );
  }

  void _initOnBuild(BuildContext context) {
    _route.initRouter();
  }
}
