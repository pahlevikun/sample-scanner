import 'package:flutter/widgets.dart';

part 'widget.dart';
part 'util.dart';

class SizeConfigBuilder extends StatelessWidget {
  const SizeConfigBuilder({Key? key, required this.builder}) : super(key: key);

  /// Builds the widget whenever the orientation changes
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizerUtil.setScreenSize(constraints, orientation);
        SizeConfig().init(context, constraints, orientation);
        return builder(context, orientation);
      });
    });
  }
}

class SizeConfig {
  static final SizeConfig _singleton = SizeConfig._internal();

  factory SizeConfig() {
    return _singleton;
  }

  SizeConfig._internal();

  static late MediaQueryData _mediaQueryData;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _blockSizeHorizontal;
  static late double _blockSizeVertical;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double _safeBlockHorizontal;
  static late double _safeBlockVertical;
  static late DeviceType _deviceType;

  void init(
    BuildContext context,
    BoxConstraints constraints,
    Orientation orientation,
  ) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;

    if (_screenWidth < 600) {
      _deviceType = DeviceType.Mobile;
    } else {
      _deviceType = DeviceType.Tablet;
    }

    if (_screenHeight < 1200) {
      _blockSizeHorizontal = _screenWidth / 100;
      _blockSizeVertical = _screenWidth / 100;

      _safeAreaHorizontal =
          _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      _safeAreaVertical =
          _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

      _safeBlockHorizontal = (_screenWidth - _safeAreaHorizontal) / 100;
      _safeBlockVertical = (_screenHeight - _safeAreaVertical) / 100;
    } else {
      _blockSizeHorizontal = _screenWidth / 120;
      _blockSizeVertical = _screenHeight / 120;

      _safeAreaHorizontal =
          _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      _safeAreaVertical =
          _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

      _safeBlockHorizontal = (_screenWidth - _safeAreaHorizontal) / 120;
      _safeBlockVertical = (_screenHeight - _safeAreaVertical) / 120;
    }
  }

  @Deprecated(
      "Deprecated, this now become not accurate, please use SizeConfigExt")
  double getFont(block) {
    if (block is double || block is int) {
      return _safeBlockHorizontal * block;
    }
    throw ArgumentError("Invalid argument (block): Should use double or int");
  }

  @Deprecated(
      "Deprecated, this now become not accurate, please use SizeConfigExt")
  double getHorizontal(block) {
    if (block is double || block is int) {
      return _safeBlockHorizontal * block;
    }
    throw ArgumentError("Invalid argument (block): Should use double or int");
  }

  @Deprecated(
      "Deprecated, this now become not accurate, please use SizeConfigExt")
  double getVertical(block) {
    if (block is double || block is int) {
      return _safeBlockVertical * block;
    }
    throw ArgumentError("Invalid argument (block): Should use double or int");
  }

  @Deprecated(
      "Deprecated, this now become not accurate, please use SizeConfigExt")
  double getPercentageHeightSize(double percent) =>
      percent > 100 || percent < 0 ? 0 : percent * _screenHeight / 100;

  @Deprecated(
      "Deprecated, this now become not accurate, please use SizeConfigExt")
  double getPercentageWidthSize(double percent) =>
      percent > 100 || percent < 0 ? 0 : percent * _screenWidth / 100;

  double getPercentageFontSize(double percent) {
    return percent * (_screenWidth / 3) / 100;
  }

  DeviceType getDeviceType() => _deviceType;

  double getScreenHeight() => _screenHeight;

  double getScreenWidth() => _screenWidth;

  double getBlockSizeHorizontal() => _blockSizeHorizontal;

  double getBlockSizeVertical() => _blockSizeVertical;
}

enum DeviceType {
  Mobile,
  Tablet,
}
