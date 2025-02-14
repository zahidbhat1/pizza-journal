import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppDevices {
  const AppDevices._();

  static void removeFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Future<String> get id async {
    if (Platform.isIOS) {
      final deviceInfo = DeviceInfoPlugin();
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor ?? '';
    } else if (Platform.isAndroid) {
      const androidId = AndroidId();
      return await androidId.getId() ?? '';
    }
    return '';
  }

  // Example: iPhone
  static Future<String> get model async {
    String deviceModel = 'unknown';
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      if (iosDeviceInfo.localizedModel.isNotEmpty) {
        deviceModel = iosDeviceInfo.localizedModel;
      }
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      if (androidDeviceInfo.manufacturer.isNotEmpty) {
        deviceModel = androidDeviceInfo.manufacturer;
      }
    }
    return deviceModel;
  }

  // Example: 17.0.2
  static Future<String> get osVersion async {
    String deviceVersion = '0';
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      if (iosDeviceInfo.systemVersion.isNotEmpty) {
        deviceVersion = iosDeviceInfo.systemVersion;
      }
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      deviceVersion = androidDeviceInfo.version.release;
    }
    return deviceVersion;
  }

  // Example: 1.0.0
  static Future<String> get appVersionNumber async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  // Example: 1
  static Future<String> get appBuildNumber async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  // Example: iPhone15,1
  static Future<String> get type async {
    String deviceType = 'unknown';
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      if (iosDeviceInfo.utsname.machine.isNotEmpty) {
        deviceType = iosDeviceInfo.utsname.machine;
      }
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      if (androidDeviceInfo.model.isNotEmpty) {
        deviceType = androidDeviceInfo.model;
      }
    }
    return deviceType;
  }

  // Example: model_iPhone__os_17.0.2__v_1__t_iPhone16,1
  static Future<String> get userAgent async {
    return 'model_${await model}__os_${await osVersion}__v_${await appBuildNumber}__t_${await type}';
  }

  static Future<String> get timezone async {
    final currentTimezone = await FlutterTimezone.getLocalTimezone();
    return currentTimezone;
  }
}
