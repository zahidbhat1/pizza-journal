import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pizzajournals/presenter/assets.gen.dart';
import 'package:pizzajournals/presenter/modals/modal.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';
import 'package:pizzajournals/presenter/themes/extensions.dart';
import 'package:pizzajournals/presenter/widgets/custom_button.dart';

class CurrentLocationModal extends StatelessWidget {
  final LatLng? userPosition;
  final String? formattedAddress;
  final Function(CameraPosition position) onCameraMove;
  final Function onCameraIdle;
  final bool isLoading;
  final VoidCallback onPressConfirm;

  const CurrentLocationModal(
      {super.key,
      this.userPosition,
      this.formattedAddress,
      required this.onCameraMove,
      required this.onCameraIdle,
      required this.isLoading,
      required this.onPressConfirm});

  @override
  Widget build(BuildContext context) {
    final typographies = context.typographies;
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.92,
      minChildSize: 0.5,
      maxChildSize: 0.92,
      builder: (_, scrollController) {
        return Modal(
          title: "My Location",
          showRightExitButton: true,
          onRightExitButtonPressed: () => Navigator.of(context).pop(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                child: Text(
                  "isThisYourPositionRightNow",
                  style: typographies.body,
                ),
              ),
              const SizedBox(height: 10),
              _buildGoogleMap(context),
              _buildFooter(context)
            ],
          ),
        );
      },
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    final typographies = context.typographies;
    return Expanded(
        child: Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _initialPosition(),
          scrollGesturesEnabled: true,
          myLocationButtonEnabled: false,
          compassEnabled: false,
          zoomControlsEnabled: false,
          onCameraMove: (position) {
            onCameraMove(position);
          },
          onCameraIdle: () {
            onCameraIdle();
          },
          gestureRecognizers: {}
            ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
            ..add(Factory<VerticalDragGestureRecognizer>(
                () => VerticalDragGestureRecognizer()))
            ..add(
                Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
            ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer())),
        ),
        Center(
          child: Image(
            image: Assets.images.markerPin.provider(),
            fit: BoxFit.fill,
            width: 32,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
              margin: const EdgeInsets.only(top: 21, left: 32, right: 32),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColors.grey2, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.15),
                    offset: const Offset(0, 3),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image(
                    image: Assets.images.pinGreySmall.provider(),
                    width: 20,
                    color: AppColors.black,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                      child: Text(
                    formattedAddress ?? '',
                    style: typographies.bodySmall.withColor(AppColors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ))
                ],
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              margin: const EdgeInsets.only(bottom: 104),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(25)),
              child: Text("dragTheMapToRepositionThePin",
                  style: typographies.bodySmall.withColor(AppColors.white))),
        )
      ],
    ));
  }

  CameraPosition _initialPosition() {
    return CameraPosition(
      target: userPosition != null
          ? userPosition!
          : const LatLng(35.7113988, 139.7803777),
      zoom: 20,
      bearing: 0.0,
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 1,
          color: AppColors.grey2,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: CustomButton(
            buttonTitle: "dragTheMapToRepositionThePin",
            buttonColor: AppColors.darkGreen,
            textStyle: context.typographies.body,
            enable: true,
            disabledButtonColor: AppColors.grey2,
            disabledTitleOpacity: 1,
            loading: isLoading,
            onPressed: onPressConfirm,
          ),
        )
      ],
    );
  }
}
