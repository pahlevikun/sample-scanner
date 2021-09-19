import 'package:Scanner/src/index.dart';

import '../form.dart';

class UserFormPage extends StatefulWidget {
  UserFormPage({Key? key}) : super(key: key);

  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => Injector.instance<UserFormBloc>()..add(UserFormInit()),
        child: UserFormView(),
      ),
    );
  }
}
