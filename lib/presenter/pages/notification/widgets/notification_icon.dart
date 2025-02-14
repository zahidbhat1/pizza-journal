import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/states/auth/auth_bloc.dart';
import 'package:pizzajournals/data/states/auth/auth_state.dart';
import 'package:pizzajournals/data/states/notification/notification_bloc.dart';
import 'package:pizzajournals/data/states/notification/notification_event.dart';
import 'package:pizzajournals/presenter/assets.gen.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';

class NotificationIcon extends StatefulWidget {
  const NotificationIcon({super.key});

  @override
  State<NotificationIcon> createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
  NotificationBloc get _notificationBloc => context.read<NotificationBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return (state.status == AuthStateStatus.authenticated)
            ? Stack(
                children: [
                  IconButton(
                    icon: Image(
                      image: Assets.images.notificationBell.provider(),
                      fit: BoxFit.contain,
                      width: 28,
                    ),
                    onPressed: () => _notificationBloc.add(const NotificationOpen()),
                  ),
                  Positioned(
                    top: 10,
                    left: 13,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
