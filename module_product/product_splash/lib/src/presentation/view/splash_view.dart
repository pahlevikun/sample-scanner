import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foundation_injector/foundation_injector.dart';
import 'package:product_splash/src/presentation/bloc/splash_bloc.dart';
import 'package:shared_manifest/manifest.dart';
import 'package:shared_router/shared_router.dart';
import 'package:shared_utilities/utilities.dart';

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
