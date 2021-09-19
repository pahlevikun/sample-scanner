import 'package:Scanner/src/index.dart';

import '../splash.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SizeConfigBuilder(
      builder: (context, orientation) => Scaffold(
        backgroundColor: ColorManifest.BACKGROUND.toColor(),
        body: Container(
          child: BlocProvider(
            create: (context) =>
                Injector.instance<SplashBloc>()..add(SplashInit()),
            child: SplashView(),
          ),
        ),
      ),
    );
  }
}
