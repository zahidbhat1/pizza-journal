import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';
import 'package:pizzajournals/presenter/widgets/custom_text_form_field.dart';

class TappableFieldInput extends StatelessWidget {
  final String? title;
  final String? hint;
  final Widget? leadingIcon;
  final TextEditingController? controller;
  final VoidCallback? onPressed;

  const TappableFieldInput({
    super.key,
    this.title,
    this.hint,
    this.leadingIcon,
    this.controller,
    this.onPressed,
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
          readOnly: true,
          leadingIcon: leadingIcon,
          showDropdownIcon: true,
          hintText: hint,
          hintTextStyle: typographies.body.withColor(colors.hint),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
