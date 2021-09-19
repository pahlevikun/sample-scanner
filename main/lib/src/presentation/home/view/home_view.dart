import 'package:Scanner/src/index.dart';
import 'package:Scanner/src/presentation/home/model/model.dart';
import 'package:lottie/lottie.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) async {
        if (state.action is GoToForm) {
          Injector.instance<NavigationDispatcher>().goToForm(context);
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: DimensionsManifest.UNIT_2.blockH,
              key: const ValueKey("spacer_1"),
            ),
            _BodyAnimation(key: const ValueKey("qr_animation"),),
            SizedBox(
              height: DimensionsManifest.UNIT_1.blockH,
              key: const ValueKey("spacer_2"),
            ),
            _ScanButton(key: const ValueKey("scan"),),
            SizedBox(
              height: DimensionsManifest.UNIT_1.blockH,
              key: const ValueKey("spacer_3"),
            ),
            _LogoutButton(key: const ValueKey("logout"),),
            SizedBox(
              height: DimensionsManifest.UNIT_2.blockH,
              key: const ValueKey("spacer_4"),
            ),
          ],
        ),
      ),
    );
  }
}

class _BodyAnimation extends StatelessWidget {
  static const QR_CODE = "resources/lottie/qrcode.json";

  const _BodyAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Lottie.asset(
            QR_CODE,
            width: getBoxSize(),
            height: getBoxSize(),
            fit: BoxFit.fill,
          ),
        ),
        Text(
          "Scan kode QR dengan menekan tombol dibawah",
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            textStyle: TextStylesManifest.H3,
          ),
        ),
      ],
    );
  }

  double getBoxSize() =>
      SizeConfig().getScreenWidth() - DimensionsManifest.UNIT_6.blockW;
}

class _ScanButton extends StatelessWidget {
  const _ScanButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            String cameraScanResult = await scanner.scan();
            Logger.debug("RESULT >> $cameraScanResult");
          },
          child: Container(
            width: SizeConfig().getScreenWidth(),
            padding: EdgeInsets.all(DimensionsManifest.UNIT_16),
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
              "Scan",
              style: GoogleFonts.nunito(
                textStyle: TextStylesManifest.H3,
                color: ColorManifest.WHITE.toColor(),
              ),
              key: const ValueKey("scan_button_title"),
            ),
            key: const ValueKey("scan_button_container"),
          ),
        );
      },
    );
  }
}


class _LogoutButton extends StatelessWidget {
  const _LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<HomeBloc>().add(Logout()),
          child: Container(
            width: SizeConfig().getScreenWidth(),
            padding: EdgeInsets.all(DimensionsManifest.UNIT_16),
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
              "Logout",
              style: GoogleFonts.nunito(
                textStyle: TextStylesManifest.H3,
                color: ColorManifest.WHITE.toColor(),
              ),
              key: const ValueKey("logout_button_title"),
            ),
            key: const ValueKey("logout_button_container"),
          ),
        );
      },
    );
  }
}
