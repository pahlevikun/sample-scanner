import 'component.config.dart';
import 'index.dart';

@injectableInit
Future<void> configureAppComponent() async => $initGetIt(Injector.instance);
