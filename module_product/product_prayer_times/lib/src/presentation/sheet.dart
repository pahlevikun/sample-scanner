import 'package:flutter/widgets.dart';
import 'package:shared_manifest/manifest.dart';
import 'package:shared_utilities/utilities.dart';

class Sheet extends StatefulWidget {
  const Sheet({
    Key? key,
  }) : super(key: key);

  @override
  _SheetState createState() => _SheetState();
}

class _SheetState extends State<Sheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Next Prayer in ",
              style: TextStylesManifest.B1.copyWith(
                color: ColorManifest.BODY_TEXT.toColor(),
              ),
            ),
            Text(
              "4:30:17",
              style: TextStylesManifest.H4.copyWith(
                color: ColorManifest.BODY_TEXT.toColor(),
              ),
            ),
          ],
        ),
        SizedBox(
          height: DimensionsManifest.UNIT_2,
        ),
        Row(
          children: [
            Text(
              "Fajr ",
              style: TextStylesManifest.B0.copyWith(
                  color: ColorManifest.BODY_TEXT.toColor(),
                  fontSize: DimensionsManifest.UNIT_42),
            ),
            Text(
              "04:44",
              style: TextStylesManifest.H4.copyWith(
                color: ColorManifest.BODY_TEXT.toColor(),
                fontSize: DimensionsManifest.UNIT_42,
              ),
            ),
          ],
        ),
        SizedBox(
          height: DimensionsManifest.UNIT_2,
        ),
        Text(
          "Muharram 2, 1443 H ",
          style: TextStylesManifest.B1.copyWith(
            color: ColorManifest.BODY_TEXT.toColor(),
          ),
        ),
      ],
    );
  }
}