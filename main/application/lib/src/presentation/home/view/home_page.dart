import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foundation_injector/foundation_injector.dart';
import 'package:shared_utilities/utilities.dart';

import '../home.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Injector.instance<HomeBloc>()..add(HomeInit()),
      child: HomeView(),
    );
  }
}
