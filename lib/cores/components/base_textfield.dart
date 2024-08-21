import 'package:flutter/material.dart';
import 'package:trinity_wizards_alkaff_pretest/consts/const_colors.dart';
import 'package:trinity_wizards_alkaff_pretest/cores/extensions/int_extensions.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField(
      {super.key,
      required this.textController,
      this.prefixWidget,
      this.suffixWidget,
      this.title = "",
      this.hint = "",
      required this.onChanged,
      this.onTap,
      this.validator,
      this.isRequired = false});
  final TextEditingController textController;
  final String title;
  final String hint;
  final bool isRequired;
  final ValueChanged<String> onChanged;
  final VoidCallback? onTap;
  //
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  //
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    final currentTextTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: currentTextTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400, color: Colors.black, fontSize: 14),
            children: <TextSpan>[
              if (isRequired)
                const TextSpan(
                    text: ' *', style: TextStyle(color: ConstColors.red)),
            ],
          ),
        ),
        9.toHeightGap(),
        TextFormField(
          controller: textController,
          style: const TextStyle(
              fontWeight: FontWeight.w200, color: Colors.black, fontSize: 14),
          onTap: onTap,
          onChanged: onChanged,
          decoration: InputDecoration(
              prefixIcon: prefixWidget, suffixIcon: suffixWidget),
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          validator: validator,
        )
      ],
    );
  }
}
