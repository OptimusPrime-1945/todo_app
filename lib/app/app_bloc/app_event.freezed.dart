// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'app_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AppEventTearOff {
  const _$AppEventTearOff();

  _AppNotAuthenticatedEvent notAuthenticated() {
    return const _AppNotAuthenticatedEvent();
  }

  _AppLoggingEvent logging() {
    return const _AppLoggingEvent();
  }

  _AppAuthenticatedEvent authenticated(User user) {
    return _AppAuthenticatedEvent(
      user,
    );
  }

  _AppLoadingEvent loading() {
    return const _AppLoadingEvent();
  }

  _AppErrorEvent error(String msg) {
    return _AppErrorEvent(
      msg,
    );
  }
}

// ignore: unused_element
const $AppEvent = _$AppEventTearOff();

mixin _$AppEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notAuthenticated(),
    @required Result logging(),
    @required Result authenticated(User user),
    @required Result loading(),
    @required Result error(String msg),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notAuthenticated(),
    Result logging(),
    Result authenticated(User user),
    Result loading(),
    Result error(String msg),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result notAuthenticated(_AppNotAuthenticatedEvent value),
    @required Result logging(_AppLoggingEvent value),
    @required Result authenticated(_AppAuthenticatedEvent value),
    @required Result loading(_AppLoadingEvent value),
    @required Result error(_AppErrorEvent value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notAuthenticated(_AppNotAuthenticatedEvent value),
    Result logging(_AppLoggingEvent value),
    Result authenticated(_AppAuthenticatedEvent value),
    Result loading(_AppLoadingEvent value),
    Result error(_AppErrorEvent value),
    @required Result orElse(),
  });
}

abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res>;
}

class _$AppEventCopyWithImpl<$Res> implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  final AppEvent _value;
  // ignore: unused_field
  final $Res Function(AppEvent) _then;
}

abstract class _$AppNotAuthenticatedEventCopyWith<$Res> {
  factory _$AppNotAuthenticatedEventCopyWith(_AppNotAuthenticatedEvent value,
          $Res Function(_AppNotAuthenticatedEvent) then) =
      __$AppNotAuthenticatedEventCopyWithImpl<$Res>;
}

class __$AppNotAuthenticatedEventCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res>
    implements _$AppNotAuthenticatedEventCopyWith<$Res> {
  __$AppNotAuthenticatedEventCopyWithImpl(_AppNotAuthenticatedEvent _value,
      $Res Function(_AppNotAuthenticatedEvent) _then)
      : super(_value, (v) => _then(v as _AppNotAuthenticatedEvent));

  @override
  _AppNotAuthenticatedEvent get _value =>
      super._value as _AppNotAuthenticatedEvent;
}

class _$_AppNotAuthenticatedEvent implements _AppNotAuthenticatedEvent {
  const _$_AppNotAuthenticatedEvent();

  @override
  String toString() {
    return 'AppEvent.notAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AppNotAuthenticatedEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notAuthenticated(),
    @required Result logging(),
    @required Result authenticated(User user),
    @required Result loading(),
    @required Result error(String msg),
  }) {
    assert(notAuthenticated != null);
    assert(logging != null);
    assert(authenticated != null);
    assert(loading != null);
    assert(error != null);
    return notAuthenticated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notAuthenticated(),
    Result logging(),
    Result authenticated(User user),
    Result loading(),
    Result error(String msg),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notAuthenticated != null) {
      return notAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result notAuthenticated(_AppNotAuthenticatedEvent value),
    @required Result logging(_AppLoggingEvent value),
    @required Result authenticated(_AppAuthenticatedEvent value),
    @required Result loading(_AppLoadingEvent value),
    @required Result error(_AppErrorEvent value),
  }) {
    assert(notAuthenticated != null);
    assert(logging != null);
    assert(authenticated != null);
    assert(loading != null);
    assert(error != null);
    return notAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notAuthenticated(_AppNotAuthenticatedEvent value),
    Result logging(_AppLoggingEvent value),
    Result authenticated(_AppAuthenticatedEvent value),
    Result loading(_AppLoadingEvent value),
    Result error(_AppErrorEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (notAuthenticated != null) {
      return notAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _AppNotAuthenticatedEvent implements AppEvent {
  const factory _AppNotAuthenticatedEvent() = _$_AppNotAuthenticatedEvent;
}

abstract class _$AppLoggingEventCopyWith<$Res> {
  factory _$AppLoggingEventCopyWith(
          _AppLoggingEvent value, $Res Function(_AppLoggingEvent) then) =
      __$AppLoggingEventCopyWithImpl<$Res>;
}

class __$AppLoggingEventCopyWithImpl<$Res> extends _$AppEventCopyWithImpl<$Res>
    implements _$AppLoggingEventCopyWith<$Res> {
  __$AppLoggingEventCopyWithImpl(
      _AppLoggingEvent _value, $Res Function(_AppLoggingEvent) _then)
      : super(_value, (v) => _then(v as _AppLoggingEvent));

  @override
  _AppLoggingEvent get _value => super._value as _AppLoggingEvent;
}

class _$_AppLoggingEvent implements _AppLoggingEvent {
  const _$_AppLoggingEvent();

  @override
  String toString() {
    return 'AppEvent.logging()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AppLoggingEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notAuthenticated(),
    @required Result logging(),
    @required Result authenticated(User user),
    @required Result loading(),
    @required Result error(String msg),
  }) {
    assert(notAuthenticated != null);
    assert(logging != null);
    assert(authenticated != null);
    assert(loading != null);
    assert(error != null);
    return logging();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notAuthenticated(),
    Result logging(),
    Result authenticated(User user),
    Result loading(),
    Result error(String msg),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (logging != null) {
      return logging();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result notAuthenticated(_AppNotAuthenticatedEvent value),
    @required Result logging(_AppLoggingEvent value),
    @required Result authenticated(_AppAuthenticatedEvent value),
    @required Result loading(_AppLoadingEvent value),
    @required Result error(_AppErrorEvent value),
  }) {
    assert(notAuthenticated != null);
    assert(logging != null);
    assert(authenticated != null);
    assert(loading != null);
    assert(error != null);
    return logging(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notAuthenticated(_AppNotAuthenticatedEvent value),
    Result logging(_AppLoggingEvent value),
    Result authenticated(_AppAuthenticatedEvent value),
    Result loading(_AppLoadingEvent value),
    Result error(_AppErrorEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (logging != null) {
      return logging(this);
    }
    return orElse();
  }
}

abstract class _AppLoggingEvent implements AppEvent {
  const factory _AppLoggingEvent() = _$_AppLoggingEvent;
}

abstract class _$AppAuthenticatedEventCopyWith<$Res> {
  factory _$AppAuthenticatedEventCopyWith(_AppAuthenticatedEvent value,
          $Res Function(_AppAuthenticatedEvent) then) =
      __$AppAuthenticatedEventCopyWithImpl<$Res>;
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

class __$AppAuthenticatedEventCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res>
    implements _$AppAuthenticatedEventCopyWith<$Res> {
  __$AppAuthenticatedEventCopyWithImpl(_AppAuthenticatedEvent _value,
      $Res Function(_AppAuthenticatedEvent) _then)
      : super(_value, (v) => _then(v as _AppAuthenticatedEvent));

  @override
  _AppAuthenticatedEvent get _value => super._value as _AppAuthenticatedEvent;

  @override
  $Res call({
    Object user = freezed,
  }) {
    return _then(_AppAuthenticatedEvent(
      user == freezed ? _value.user : user as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    if (_value.user == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

class _$_AppAuthenticatedEvent implements _AppAuthenticatedEvent {
  const _$_AppAuthenticatedEvent(this.user) : assert(user != null);

  @override
  final User user;

  @override
  String toString() {
    return 'AppEvent.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppAuthenticatedEvent &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @override
  _$AppAuthenticatedEventCopyWith<_AppAuthenticatedEvent> get copyWith =>
      __$AppAuthenticatedEventCopyWithImpl<_AppAuthenticatedEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notAuthenticated(),
    @required Result logging(),
    @required Result authenticated(User user),
    @required Result loading(),
    @required Result error(String msg),
  }) {
    assert(notAuthenticated != null);
    assert(logging != null);
    assert(authenticated != null);
    assert(loading != null);
    assert(error != null);
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notAuthenticated(),
    Result logging(),
    Result authenticated(User user),
    Result loading(),
    Result error(String msg),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result notAuthenticated(_AppNotAuthenticatedEvent value),
    @required Result logging(_AppLoggingEvent value),
    @required Result authenticated(_AppAuthenticatedEvent value),
    @required Result loading(_AppLoadingEvent value),
    @required Result error(_AppErrorEvent value),
  }) {
    assert(notAuthenticated != null);
    assert(logging != null);
    assert(authenticated != null);
    assert(loading != null);
    assert(error != null);
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notAuthenticated(_AppNotAuthenticatedEvent value),
    Result logging(_AppLoggingEvent value),
    Result authenticated(_AppAuthenticatedEvent value),
    Result loading(_AppLoadingEvent value),
    Result error(_AppErrorEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AppAuthenticatedEvent implements AppEvent {
  const factory _AppAuthenticatedEvent(User user) = _$_AppAuthenticatedEvent;

  User get user;

  _$AppAuthenticatedEventCopyWith<_AppAuthenticatedEvent> get copyWith;
}

abstract class _$AppLoadingEventCopyWith<$Res> {
  factory _$AppLoadingEventCopyWith(
          _AppLoadingEvent value, $Res Function(_AppLoadingEvent) then) =
      __$AppLoadingEventCopyWithImpl<$Res>;
}

class __$AppLoadingEventCopyWithImpl<$Res> extends _$AppEventCopyWithImpl<$Res>
    implements _$AppLoadingEventCopyWith<$Res> {
  __$AppLoadingEventCopyWithImpl(
      _AppLoadingEvent _value, $Res Function(_AppLoadingEvent) _then)
      : super(_value, (v) => _then(v as _AppLoadingEvent));

  @override
  _AppLoadingEvent get _value => super._value as _AppLoadingEvent;
}

class _$_AppLoadingEvent implements _AppLoadingEvent {
  const _$_AppLoadingEvent();

  @override
  String toString() {
    return 'AppEvent.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AppLoadingEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notAuthenticated(),
    @required Result logging(),
    @required Result authenticated(User user),
    @required Result loading(),
    @required Result error(String msg),
  }) {
    assert(notAuthenticated != null);
    assert(logging != null);
    assert(authenticated != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notAuthenticated(),
    Result logging(),
    Result authenticated(User user),
    Result loading(),
    Result error(String msg),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result notAuthenticated(_AppNotAuthenticatedEvent value),
    @required Result logging(_AppLoggingEvent value),
    @required Result authenticated(_AppAuthenticatedEvent value),
    @required Result loading(_AppLoadingEvent value),
    @required Result error(_AppErrorEvent value),
  }) {
    assert(notAuthenticated != null);
    assert(logging != null);
    assert(authenticated != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notAuthenticated(_AppNotAuthenticatedEvent value),
    Result logging(_AppLoggingEvent value),
    Result authenticated(_AppAuthenticatedEvent value),
    Result loading(_AppLoadingEvent value),
    Result error(_AppErrorEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AppLoadingEvent implements AppEvent {
  const factory _AppLoadingEvent() = _$_AppLoadingEvent;
}

abstract class _$AppErrorEventCopyWith<$Res> {
  factory _$AppErrorEventCopyWith(
          _AppErrorEvent value, $Res Function(_AppErrorEvent) then) =
      __$AppErrorEventCopyWithImpl<$Res>;

  $Res call({String msg});
}

class __$AppErrorEventCopyWithImpl<$Res> extends _$AppEventCopyWithImpl<$Res>
    implements _$AppErrorEventCopyWith<$Res> {
  __$AppErrorEventCopyWithImpl(
      _AppErrorEvent _value, $Res Function(_AppErrorEvent) _then)
      : super(_value, (v) => _then(v as _AppErrorEvent));

  @override
  _AppErrorEvent get _value => super._value as _AppErrorEvent;

  @override
  $Res call({
    Object msg = freezed,
  }) {
    return _then(_AppErrorEvent(
      msg == freezed ? _value.msg : msg as String,
    ));
  }
}

class _$_AppErrorEvent implements _AppErrorEvent {
  const _$_AppErrorEvent(this.msg) : assert(msg != null);

  @override
  final String msg;

  @override
  String toString() {
    return 'AppEvent.error(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppErrorEvent &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(msg);

  @override
  _$AppErrorEventCopyWith<_AppErrorEvent> get copyWith =>
      __$AppErrorEventCopyWithImpl<_AppErrorEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notAuthenticated(),
    @required Result logging(),
    @required Result authenticated(User user),
    @required Result loading(),
    @required Result error(String msg),
  }) {
    assert(notAuthenticated != null);
    assert(logging != null);
    assert(authenticated != null);
    assert(loading != null);
    assert(error != null);
    return error(msg);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notAuthenticated(),
    Result logging(),
    Result authenticated(User user),
    Result loading(),
    Result error(String msg),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result notAuthenticated(_AppNotAuthenticatedEvent value),
    @required Result logging(_AppLoggingEvent value),
    @required Result authenticated(_AppAuthenticatedEvent value),
    @required Result loading(_AppLoadingEvent value),
    @required Result error(_AppErrorEvent value),
  }) {
    assert(notAuthenticated != null);
    assert(logging != null);
    assert(authenticated != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notAuthenticated(_AppNotAuthenticatedEvent value),
    Result logging(_AppLoggingEvent value),
    Result authenticated(_AppAuthenticatedEvent value),
    Result loading(_AppLoadingEvent value),
    Result error(_AppErrorEvent value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AppErrorEvent implements AppEvent {
  const factory _AppErrorEvent(String msg) = _$_AppErrorEvent;

  String get msg;
  _$AppErrorEventCopyWith<_AppErrorEvent> get copyWith;
}
