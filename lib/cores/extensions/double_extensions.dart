import 'package:flutter/widgets.dart';

extension DoubleExtensions on double {
  Widget toHeightGap() {
    return SizedBox(
      height: this,
    );
  }

  Widget toWidthGap() {
    return SizedBox(
      width: this,
    );
  }
}
