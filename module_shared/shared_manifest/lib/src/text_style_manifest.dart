import 'package:flutter/material.dart';
import 'package:shared_manifest/manifest.dart';

class TextStylesManifest {
  static const textSemiLight = TextStyle(fontWeight: FontWeight.w100);
  static const textLight = TextStyle(fontWeight: FontWeight.w200);
  static const textExtraLight = TextStyle(fontWeight: FontWeight.w200);
  static const textRegular = TextStyle(fontWeight: FontWeight.w400);
  static const textMedium = TextStyle(fontWeight: FontWeight.w500);
  static const textSemiBold = TextStyle(fontWeight: FontWeight.w600);
  static const textBold = TextStyle(fontWeight: FontWeight.w700);
  static const textExtraBold = TextStyle(fontWeight: FontWeight.w900);

  static final H0 = textBold.copyWith(
    color: _fromHex(ColorManifest.HEADER_TEXT),
    fontSize: DimensionsManifest.FONT_H0,
  );

  static final H1 = textBold.copyWith(
    color: _fromHex(ColorManifest.HEADER_TEXT),
    fontSize: DimensionsManifest.FONT_H1,
  );

  static final H2 = textBold.copyWith(
    color: _fromHex(ColorManifest.HEADER_TEXT),
    fontSize: DimensionsManifest.FONT_H2,
  );

  static final H3 = textBold.copyWith(
    color: _fromHex(ColorManifest.HEADER_TEXT),
    fontSize: DimensionsManifest.FONT_H3,
  );

  static final H4 = textBold.copyWith(
    color: _fromHex(ColorManifest.HEADER_TEXT),
    fontSize: DimensionsManifest.FONT_H4,
  );

  static final H5 = textBold.copyWith(
    color: _fromHex(ColorManifest.HEADER_TEXT),
    fontSize: DimensionsManifest.FONT_H5,
  );

  static final H6 = textBold.copyWith(
    color: _fromHex(ColorManifest.HEADER_TEXT),
    fontSize: DimensionsManifest.FONT_H6,
  );

  static final H7 = textBold.copyWith(
    color: _fromHex(ColorManifest.HEADER_TEXT),
    fontSize: DimensionsManifest.FONT_H7,
  );

  static final H8 = textBold.copyWith(
    color: _fromHex(ColorManifest.HEADER_TEXT),
    fontSize: DimensionsManifest.FONT_H8,
  );

  static final H9 = textBold.copyWith(
    color: _fromHex(ColorManifest.HEADER_TEXT),
    fontSize: DimensionsManifest.FONT_H9,
  );

  static final H10 = textBold.copyWith(
    color: _fromHex(ColorManifest.HEADER_TEXT),
    fontSize: DimensionsManifest.FONT_H10,
  );

  static final B0 = textRegular.copyWith(
    color: _fromHex(ColorManifest.BODY_TEXT),
    fontSize: DimensionsManifest.FONT_B0,
  );

  static final B1 = textRegular.copyWith(
    color: _fromHex(ColorManifest.BODY_TEXT),
    fontSize: DimensionsManifest.FONT_B1,
  );

  static final B2 = textRegular.copyWith(
    color: _fromHex(ColorManifest.BODY_TEXT),
    fontSize: DimensionsManifest.FONT_B2,
  );

  static final B3 = textRegular.copyWith(
    color: _fromHex(ColorManifest.BODY_TEXT),
    fontSize: DimensionsManifest.FONT_B3,
  );

  static final B4 = textRegular.copyWith(
    color: _fromHex(ColorManifest.BODY_TEXT),
    fontSize: DimensionsManifest.FONT_B4,
  );

  static final B5 = textRegular.copyWith(
    color: _fromHex(ColorManifest.BODY_TEXT),
    fontSize: DimensionsManifest.FONT_B5,
  );

  static final B6 = textRegular.copyWith(
    color: _fromHex(ColorManifest.BODY_TEXT),
    fontSize: DimensionsManifest.FONT_B6,
  );

  static final B7 = textRegular.copyWith(
    color: _fromHex(ColorManifest.BODY_TEXT),
    fontSize: DimensionsManifest.FONT_B7,
  );

  static final B8 = textRegular.copyWith(
    color: _fromHex(ColorManifest.BODY_TEXT),
    fontSize: DimensionsManifest.FONT_B8,
  );

  static final B9 = textRegular.copyWith(
    color: _fromHex(ColorManifest.BODY_TEXT),
    fontSize: DimensionsManifest.FONT_B9,
  );

  static final B10 = textRegular.copyWith(
    color: _fromHex(ColorManifest.BODY_TEXT),
    fontSize: DimensionsManifest.FONT_B10,
  );

  static Color _fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
