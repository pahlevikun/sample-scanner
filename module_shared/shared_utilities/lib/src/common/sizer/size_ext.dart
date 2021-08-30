import 'package:shared_utilities/src/common/sizer/size_config.dart';

extension SizeExt on num {
  double get h => this._toHeightPercentage;

  double get w => this._toWidthPercentage;

  double get sp => this._toFontPercentage;

  double get blockH => this._toHeightBlock;

  double get blockW => this._toWidthBlock;

  double get blockSp => this._toFontBlock;

  double get _toHeightPercentage =>
      SizeConfig().getPercentageHeightSize(this.toDouble());

  double get _toWidthPercentage =>
      SizeConfig().getPercentageWidthSize(this.toDouble());

  double get _toFontPercentage =>
      SizeConfig().getPercentageFontSize(this.toDouble());

  double get _toHeightBlock => SizeConfig().getVertical(this.toDouble());

  double get _toWidthBlock => SizeConfig().getHorizontal(this.toDouble());

  double get _toFontBlock => SizeConfig().getFont(this.toDouble());
}
