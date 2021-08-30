import 'package:flutter/widgets.dart';
import 'package:shared_manifest/manifest.dart';
import 'package:shared_utilities/utilities.dart';

class Backdrop extends StatefulWidget {
  const Backdrop({
    Key? key,
  }) : super(key: key);

  String get ID => hashCode.toString();

  @override
  _BackdropState createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop> {
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
                color: ColorManifest.BLUE_10.toColor(),
              ),
            ),
            Text(
              "4:30:17",
              style: TextStylesManifest.H4.copyWith(
                color: ColorManifest.BLUE_10.toColor(),
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
                  color: ColorManifest.BLUE_10.toColor(),
                  fontSize: DimensionsManifest.UNIT_42),
            ),
            Text(
              "04:44",
              style: TextStylesManifest.H4.copyWith(
                color: ColorManifest.BLUE_10.toColor(),
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
            color: ColorManifest.BLUE_10.toColor(),
          ),
        ),
      ],
    );
  }
}
