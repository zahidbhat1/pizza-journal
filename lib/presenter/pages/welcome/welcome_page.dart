import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/states/welcome/welcome_bloc.dart';
import 'package:pizzajournals/data/states/welcome/welcome_event.dart';
import 'package:pizzajournals/di.dart';
import 'package:pizzajournals/gen/assets.gen.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';
import 'package:pizzajournals/presenter/widgets/custom_button.dart';
import 'package:pizzajournals/presenter/widgets/custom_text_icon_button.dart';

@RoutePage()
class WelcomePage extends StatefulWidget implements AutoRouteWrapper {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<WelcomeBloc>(
      create: (context) => WelcomeBloc(
        router: getIt(),
      ),
      child: this,
    );
  }
}

class _WelcomePageState extends State<WelcomePage> {
  WelcomeBloc get _welcomeBloc => context.read<WelcomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          _buildHeader(),
          const Spacer(flex: 3),
          _buildBody(),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Image(
          image: Assets.images.icLogo.provider(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    final typographies = context.typographies;
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomButton(
            buttonTitle: "Login Or Signup",
            buttonColor: AppColors.white,
            splashColor: AppColors.grey2,
            textStyle: typographies.body,
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            textColor: AppColors.darkGreen,
            onPressed: () => _welcomeBloc.add(const WelcomeLoginSignup()),
          ),
          CustomTextIconButton(
            buttonTitle: "Skip",
            buttonColor: AppColors.white,
            buttonTextStyle: typographies.captionExtraLarge.copyWith(
              decoration: TextDecoration.underline,
            ),
            onPressed: () => _welcomeBloc.add(const WelcomeSkip()),
          ),
        ],
      ),
    );
  }
}
