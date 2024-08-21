import 'package:flutter/material.dart';
import 'package:trinity_wizards_alkaff_pretest/consts/const_colors.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/styles/text_styles.dart';

class CtaButton extends StatelessWidget {
  const CtaButton(
      {super.key,
      this.height = 53,
      this.width = double.maxFinite,
      this.backgroundColor = ConstColors.blueAccent,
      required this.onPressed,
      this.text = "",
      this.borderRadius = 10,
      this.borderColor = Colors.transparent,
      this.fontWeight = FontWeight.w900,
      this.foregroundColor = ConstColors.blue});

  final double height;
  final double width;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onPressed;
  final String text;
  final double borderRadius;
  final Color borderColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: WidgetStateProperty.all(0.5),
              shadowColor:
                  WidgetStatePropertyAll(Colors.black.withOpacity(0.5)),
              backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
              foregroundColor: WidgetStateProperty.all<Color>(foregroundColor),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      side: BorderSide(color: borderColor)))),
          onPressed: () {
            onPressed.call();
          },
          child: Text(text).fontWeight(fontWeight).fontSize(16)),
    );
  }
}
