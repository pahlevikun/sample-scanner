import 'package:Pomodoro/src/index.dart';

class BackdropUpperLayer extends StatefulWidget {
  const BackdropUpperLayer({
    Key? key,
  }) : super(key: key);

  @override
  _BackdropUpperLayerState createState() => _BackdropUpperLayerState();
}

class _BackdropUpperLayerState extends State<BackdropUpperLayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(DimensionsManifest.UNIT_32),
          topRight: Radius.circular(DimensionsManifest.UNIT_32),
        ),
        child: Container(
          color: ColorManifest.WHITE.toColor(),
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
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
                  for (var item in sheetWidgets) item.widget.child(),
                ],
              ),
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorManifest.BLACK.toColor().withOpacity(0.2),
            blurRadius: 12.0,
            offset: Offset(0, -4),
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(DimensionsManifest.UNIT_32),
      ),
    );
  }
}
