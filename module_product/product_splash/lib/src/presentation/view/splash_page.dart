import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foundation_injector/foundation_injector.dart';
import 'package:product_splash/src/presentation/bloc/splash_bloc.dart';
import 'package:product_splash/src/presentation/view/view.dart';
import 'package:shared_manifest/manifest.dart';
import 'package:shared_utilities/utilities.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SizeConfigBuilder(
      builder: (context, orientation, deviceType) => Scaffold(
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
