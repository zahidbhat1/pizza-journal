import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';
import 'package:pizzajournals/presenter/widgets/bottom_sheet_action.dart';
import 'package:pizzajournals/services/permission_service.dart';

@singleton
class ImageService {
  final AppRouter _router;
  final PermissionService _permissionService;

  BuildContext? get context {
    return _router.navigatorKey.currentContext;
  }

  ImageService({
    required AppRouter router,
    required PermissionService permissionService,
  })  : _router = router,
        _permissionService = permissionService;

  void openImagePicker({
    Function(XFile)? onImage,
  }) {
    if (context != null) {
      showAdaptiveActionSheet(
        context: context!,
        actions: [
          BottomSheetAction(
            title: Text("LocaleKeys.takePhoto.tr()"),
            onPressed: (_) async {
              final isGranted =
                  await _permissionService.requestCameraPermission();
              if (isGranted) {
                final imagePicker = ImagePicker();
                final image = await imagePicker.pickImage(
                  source: ImageSource.camera,
                );
                if (image != null && onImage != null) {
                  onImage(image);
                  _router.pop();
                }
              }
            },
            leading: const Icon(
              Icons.add_a_photo_outlined,
              color: Colors.blue,
            ),
          ),
          BottomSheetAction(
            title: Text("LocaleKeys.chooseFromLibrary.tr()"),
            onPressed: (_) async {
              final isGranted =
                  await _permissionService.requestPhotoPermission();
              if (isGranted) {
                final imagePicker = ImagePicker();
                final image = await imagePicker.pickImage(
                  source: ImageSource.gallery,
                );
                if (image != null && onImage != null) {
                  onImage(image);
                  _router.pop();
                }
              }
            },
            leading: const Icon(
              Icons.add_photo_alternate_outlined,
              color: Colors.blue,
            ),
          ),
        ],
        cancelAction: CancelAction(
          title: Text("Cancel"),
          onPressed: (_) => _router.pop(),
        ),
      );
    }
  }
}
