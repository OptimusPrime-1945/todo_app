import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoapps/Models/User.dart';

part 'app_event.freezed.dart';

@freezed
abstract class AppEvent with _$AppEvent {
  const factory AppEvent.notAuthenticated() = _AppNotAuthenticatedEvent;

  const factory AppEvent.loading() = _AppLoadingEvent;

  const factory AppEvent.authenticated(User user) =_AppAuthenticatedEvent;
}
