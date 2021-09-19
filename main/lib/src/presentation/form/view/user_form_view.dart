import 'package:Scanner/src/index.dart';
import 'package:Scanner/src/presentation/form/model/model.dart';

class UserFormView extends StatelessWidget {
  const UserFormView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserFormBloc, UserFormState>(
      listener: (context, state) {
        if (state.action is GoToScan) {
          Injector.instance<NavigationDispatcher>().goToHome(context);
        }
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -SizeConfig().getScreenHeight() * .15, right: -SizeConfig().getScreenWidth() * .4,
            child: BezierContainer(
              key: const ValueKey("bezier_container"),
            ),
          ),
          Container(
            height: SizeConfig().getScreenHeight(),
            padding:
                EdgeInsets.symmetric(horizontal: DimensionsManifest.UNIT_20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    key: const ValueKey("space_1"),
                    height: DimensionsManifest.UNIT_10.blockH,
                  ),
                  Header(
                    key: const ValueKey("title"),
                  ),
                  SizedBox(
                    key: const ValueKey("space_2"),
                    height: DimensionsManifest.UNIT_10.blockH,
                  ),
                  _UserIdInputField(
                    key: const ValueKey("input"),
                  ),
                  SizedBox(
                    key: const ValueKey("space_3"),
                    height: DimensionsManifest.UNIT_5.blockH,
                  ),
                  _SubmitButton(
                    key: const ValueKey("submit"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: DimensionsManifest.UNIT_2.h),
      child: Text(
        "Inveet.id",
        style: GoogleFonts.nunito(
          textStyle: TextStylesManifest.H0,
        ),
        key: const Key('title_text'),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFormBloc, UserFormState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<UserFormBloc>().add(VerifyUserId());
          },
          child: Container(
            width: SizeConfig().getScreenWidth(),
            padding: EdgeInsets.symmetric(vertical: DimensionsManifest.UNIT_16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  DimensionsManifest.UNIT_5,
                ),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(
                    DimensionsManifest.UNIT_2,
                    DimensionsManifest.UNIT_4,
                  ),
                  blurRadius: DimensionsManifest.UNIT_5,
                  spreadRadius: DimensionsManifest.UNIT_2,
                )
              ],
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  ColorManifest.PRIMARY.toColor(),
                  ColorManifest.ACCENT.toColor(),
                ],
              ),
            ),
            child: Text(
              "Login",
              style: GoogleFonts.nunito(
                textStyle: TextStylesManifest.H3,
                color: ColorManifest.WHITE.toColor(),
              ),
              key: const ValueKey("submit_button_title"),
            ),
            key: const ValueKey("submit_button_container"),
          ),
        );
      },
    );
  }
}

class _UserIdInputField extends StatelessWidget {
  const _UserIdInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFormBloc, UserFormState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: DimensionsManifest.UNIT_10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "User ID",
                style: GoogleFonts.nunito(
                  textStyle: TextStylesManifest.H5,
                ),
                key: const Key('user_id_input_title'),
              ),
              SizedBox(
                height: DimensionsManifest.UNIT_10,
                key: const Key('user_id_input_space'),
              ),
              TextField(
                key: const Key('user_id_input_field'),
                onChanged: (userId) =>
                    context.read<UserFormBloc>().add(UpdateUserId(userId)),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: "Enter user id",
                  border: InputBorder.none,
                  fillColor: ColorManifest.BLACK_10.toColor(),
                  filled: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
