import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';
import 'package:pizzajournals/presenter/widgets/custom_button.dart';

enum OnboardingFooterStep {
  one(0),
  two(1),
  three(2),
  four(3),
  five(4),
  six(5),
  seven(6);

  final int step;

  const OnboardingFooterStep(this.step);
}

class OnboardingFooter extends StatelessWidget {
  final OnboardingFooterStep step;
  final String? rightButtonTitle;
  final bool isRightButtonLoading;
  final bool isRightButtonEnable;
  final VoidCallback? onRightButtonPressed;
  final String? leftButtonTitle;
  final bool isLeftButtonLoading;
  final bool isLeftButtonEnable;
  final VoidCallback? onLeftButtonPressed;

  const OnboardingFooter({
    super.key,
    required this.step,
    this.rightButtonTitle,
    this.isRightButtonLoading = false,
    this.isRightButtonEnable = false,
    this.onRightButtonPressed,
    this.leftButtonTitle,
    this.isLeftButtonLoading = false,
    this.isLeftButtonEnable = false,
    this.onLeftButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final typographies = context.typographies;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Container(
              height: 3,
              color: AppColors.grey2,
            ),
            FractionallySizedBox(
              widthFactor: step.step / (OnboardingFooterStep.values.length - 1),
              child: Container(
                height: 3,
                color: AppColors.green,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 16,
            top: 10.5,
            right: 16,
          ),
          child: Row(
            children: [
              if (leftButtonTitle?.isNotEmpty ?? false)
                CustomButton(
                  buttonTitle: leftButtonTitle,
                  buttonColor: AppColors.white,
                  borderColor: AppColors.darkGreen,
                  borderWidth: 1.5,
                  textStyle: typographies.body,
                  textColor: AppColors.darkGreen,
                  enable: isLeftButtonEnable,
                  disabledTitleOpacity: 1,
                  loading: isLeftButtonLoading,
                  onPressed: onLeftButtonPressed,
                ),
              const Spacer(),
              if (rightButtonTitle?.isNotEmpty ?? false)
                CustomButton(
                  buttonTitle: rightButtonTitle,
                  buttonColor: AppColors.darkGreen,
                  textStyle: typographies.body,
                  enable: isRightButtonEnable,
                  disabledButtonColor: AppColors.grey2,
                  disabledTitleOpacity: 1,
                  loading: isRightButtonLoading,
                  onPressed: onRightButtonPressed,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
