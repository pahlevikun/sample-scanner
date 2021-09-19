import 'package:Scanner/src/index.dart';

import '../home.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => Injector.instance<HomeBloc>()..add(HomeInit()),
        child: HomeView(),
      ),
    );
  }
}
