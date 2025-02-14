import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/assets.gen.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';
import 'package:pizzajournals/presenter/widgets/custom_button.dart';

class LoginSignupModal extends StatelessWidget {
  final VoidCallback? onLoginSignupPressed;

  const LoginSignupModal({
    super.key,
    this.onLoginSignupPressed,
  });

  @override
  Widget build(BuildContext context) {
    final typographies = context.typographies;
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  alignment: Alignment.centerRight,
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      splashRadius: 24,
                      icon: Image(
                        image: Assets.images.close.provider(),
                        fit: BoxFit.contain,
                        width: 28,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "logInOrSignUpToUseThisFeature",
                        style: typographies.body,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        buttonTitle: "logInOrSignUpButton",
                        buttonColor: AppColors.darkGreen,
                        textStyle: typographies.body,
                        onPressed: onLoginSignupPressed,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
