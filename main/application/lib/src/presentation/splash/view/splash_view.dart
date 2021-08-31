import 'package:Pomodoro/src/index.dart';
import 'package:Pomodoro/src/presentation/splash/model/model.dart';

import '../splash.dart';

class SplashView extends StatefulWidget {
  SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.action is Done) {
          Injector.instance<NavigationDispatcher>().goToHome(context);
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorManifest.BACKGROUND.toColor(),
      ),
    );
  }
}
