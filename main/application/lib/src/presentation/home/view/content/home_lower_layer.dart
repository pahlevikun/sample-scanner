import 'package:Pomodoro/src/index.dart';

class BackdropLowerLayer extends StatelessWidget {
  const BackdropLowerLayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManifest.PRIMARY.toColor(),
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + DimensionsManifest.UNIT_16,
        left: DimensionsManifest.UNIT_16,
        right: DimensionsManifest.UNIT_16,
        bottom: DimensionsManifest.UNIT_16,
      ),
      child: ScrollConfiguration(
        behavior: HideableGlowBehavior(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var item in backdropWidgets) item.widget.child(),
            ],
          ),
        ),
      ),
    );
  }
}
