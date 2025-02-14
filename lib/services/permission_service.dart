import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';
import 'package:pizzajournals/utils/alert_manager.dart';

@singleton
class PermissionService {
  final AppRouter _router;
  final AlertManager _alertManager;

  BuildContext? get context {
    return _router.navigatorKey.currentContext;
  }

  PermissionService({
    required AppRouter router,
    required AlertManager alertManager,
  })  : _router = router,
        _alertManager = alertManager;

  Future<bool> _requestPermission({
    required Permission permission,
  }) async {
    final isGranted = await permission.request().isGranted;
    final isLimited = await permission.request().isLimited;
    if (isGranted || isLimited) {
      return true;
    } else {
      if (context?.mounted ?? false) {
        _openSettingsAlertController(
          permission: permission,
        );
      }
      return false;
    }
  }

  void _openSettingsAlertController({
    required Permission permission,
  }) {
    var title = '';
    var content = '';
    switch (permission) {
      case Permission.camera:
        title = '';
        content = "Need Camera Permission";
      case Permission.photos:
        title = '';
        content = "Need Media Permission";
    }
    if (context != null) {
      _alertManager.openAlertController(
        title: title,
        content: content,
        action1: "Later",
        onAction1: () => _router.pop(),
        action2: "Settings",
        onAction2: () {
          openAppSettings();
          _router.pop();
        },
      );
    }
  }

  Future<bool> requestCameraPermission() async {
    return _requestPermission(
      permission: Permission.camera,
    );
  }

  Future<bool> requestPhotoPermission() async {
    return _requestPermission(
      permission: Permission.photos,
    );
  }
}
