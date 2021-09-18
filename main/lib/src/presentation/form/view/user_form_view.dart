import 'package:Scanner/src/index.dart';

class UserFormView extends StatefulWidget {
  UserFormView({Key? key}) : super(key: key);

  @override
  _UserFormViewState createState() => _UserFormViewState();
}

class _UserFormViewState extends State<UserFormView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManifest.PRIMARY.toColor(),
      extendBody: true,
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => Container(),
        ),
      ),
    );
  }
}
