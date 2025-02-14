import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/states/notification/notification_event.dart';
import 'package:pizzajournals/data/states/notification/notification_state.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';
import 'package:injectable/injectable.dart';

@singleton
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final AppRouter _router;

  NotificationBloc({
    required AppRouter router,
  })  : _router = router,
        super(const NotificationState()) {
    on<NotificationLoad>(_onLoad);
    on<NotificationOpen>(_onOpen);
  }

  void _onLoad(
    NotificationLoad event,
    Emitter<NotificationState> emit,
  ) async {}

  void _onOpen(
    NotificationOpen event,
    Emitter<NotificationState> emit,
  ) async {}
}
