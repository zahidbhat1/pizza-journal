import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';

@singleton
class AlertManager {
  final AppRouter _router;

  BuildContext? get context {
    return _router.navigatorKey.currentContext;
  }

  AlertManager({
    required AppRouter router,
  }) : _router = router;

  void showSuccess({
    String? title,
    String? message,
  }) {
    final titleIsNotEmpty = title?.isNotEmpty ?? false;
    final messageIsNotEmpty = message?.isNotEmpty ?? false;
    final showMessage = titleIsNotEmpty || messageIsNotEmpty;
    if (context != null && showMessage) {
      Flushbar(
        title: title,
        message: message,
        backgroundColor: AppColors.darkGreen,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ).show(context!);
    }
  }

  void showError({
    String? title,
    String? message,
  }) {
    final titleIsNotEmpty = title?.isNotEmpty ?? false;
    final messageIsNotEmpty = message?.isNotEmpty ?? false;
    final showMessage = titleIsNotEmpty || messageIsNotEmpty;
    if (context != null && showMessage) {
      Flushbar(
        title: title,
        message: message,
        backgroundColor: AppColors.red,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ).show(context!);
    }
  }

  void showValidation({
    String? title,
    String? message,
  }) {
    final titleIsNotEmpty = title?.isNotEmpty ?? false;
    final messageIsNotEmpty = message?.isNotEmpty ?? false;
    final showMessage = titleIsNotEmpty || messageIsNotEmpty;
    if (context != null && showMessage) {
      Flushbar(
        title: title,
        message: message,
        backgroundColor: AppColors.orange,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ).show(context!);
    }
  }

  void showFeatureNotAvailable({
    String? message,
  }) {
    if (context != null) {
      Flushbar(
        title: "Feature Not Available",
        message: message ?? "Feature Not Available",
        backgroundColor: AppColors.grey,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ).show(context!);
    }
  }

  void openAlertController({
    String? title,
    String? content,
    String? action1,
    Widget? action1Widget,
    Function? onAction1,
    String? action2,
    Widget? action2Widget,
    Function? onAction2,
  }) {
    if (context != null) {
      showPlatformDialog(
        context: context!,
        builder: (_) {
          return PlatformAlertDialog(
            title: (title?.isNotEmpty ?? false) ? Text(title ?? '') : null,
            content:
                (content?.isNotEmpty ?? false) ? Text(content ?? '') : null,
            actions: [
              if (action1?.isNotEmpty ?? false)
                PlatformDialogAction(
                  child: PlatformText(
                    action1 ?? '',
                    style: const TextStyle(color: Colors.blue),
                  ),
                  onPressed: () => (onAction1 != null) ? onAction1() : null,
                )
              else if (action1Widget != null)
                PlatformDialogAction(
                  child: action1Widget,
                  onPressed: () => (onAction1 != null) ? onAction1() : null,
                ),
              if (action2?.isNotEmpty ?? false)
                PlatformDialogAction(
                  child: PlatformText(
                    action2 ?? '',
                    style: const TextStyle(color: Colors.blue),
                  ),
                  onPressed: () => (onAction2 != null) ? onAction2() : null,
                )
              else if (action2Widget != null)
                PlatformDialogAction(
                  child: action2Widget,
                  onPressed: () => (onAction2 != null) ? onAction2() : null,
                ),
            ],
          );
        },
      );
    }
  }
}
