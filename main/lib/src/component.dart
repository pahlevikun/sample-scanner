import 'component.config.dart';
import 'index.dart';

@injectableInit
Future<void> configureAppComponent() async => await $initGetIt(Injector.instance);
