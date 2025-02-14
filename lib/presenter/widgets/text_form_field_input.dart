import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';
import 'package:pizzajournals/presenter/widgets/custom_text_form_field.dart';

class TextFormFieldInput extends StatelessWidget {
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final bool obscureText;
  final int line;
  final TextInputType? keyboardType;
  final Function(String text)? onChanged;
  final Function(String text)? onSubmitted;

  const TextFormFieldInput({
    super.key,
    this.title,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.line = 1,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typographies = context.typographies;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title?.isNotEmpty ?? false)
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: Text(
              title ?? '',
              style: typographies.bodyExtraSmall.withColor(AppColors.grey),
            ),
          ),
        CustomTextFormField(
          controller: controller,
          textStyle: typographies.body,
          borderRadius: 10,
          borderColor: colors.border,
          borderWidth: 1,
          obscureText: obscureText,
          minLine: line,
          maxLine: line,
          hintText: hint,
          hintTextStyle: typographies.body.withColor(colors.hint),
          keyboardType: keyboardType,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
        ),
      ],
    );
  }
}
