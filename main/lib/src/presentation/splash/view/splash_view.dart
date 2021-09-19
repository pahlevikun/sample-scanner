import 'package:Scanner/src/index.dart';
import 'package:Scanner/src/presentation/splash/model/model.dart';

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
        if (state.action is SessionValid) {
          Injector.instance<NavigationDispatcher>().goToHome(context);
        } else if (state.action is SessionInValid) {
          Injector.instance<NavigationDispatcher>().goToForm(context);
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorManifest.PRIMARY.toColor(),
        child: Center(
          child: Text(
            // TODO: Avoid hardcoded and extract into json / arb for translation
            "Inveet Scanner",
            style: GoogleFonts.nunito(
              textStyle: TextStylesManifest.H1,
              color: ColorManifest.WHITE.toColor(),
            ),
          ),
        ),
      ),
    );
  }
}
