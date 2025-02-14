import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/states/action/action_bloc.dart';
import 'package:pizzajournals/data/states/action/action_event.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';
import 'package:pizzajournals/presenter/widgets/custom_button.dart';

class LoginSignupItem extends StatefulWidget {
  final VoidCallback? onLoginSignupPressed;

  const LoginSignupItem({
    super.key,
    this.onLoginSignupPressed,
  });

  @override
  State<LoginSignupItem> createState() => _LoginSignupItemState();
}

class _LoginSignupItemState extends State<LoginSignupItem> {
  ActionBloc get _actionBloc => context.read<ActionBloc>();

  @override
  Widget build(BuildContext context) {
    final typographies = context.typographies;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey2),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "logInOrSignUpFindOutMore",
                style: typographies.body,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    buttonTitle: "Login or Signup",
                    buttonColor: AppColors.white,
                    borderColor: AppColors.darkGreen,
                    splashColor: AppColors.grey2,
                    borderWidth: 1.5,
                    textStyle: typographies.body,
                    textColor: AppColors.darkGreen,
                    onPressed: () =>
                        _actionBloc.add(const ActionLoginSignupNow()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
