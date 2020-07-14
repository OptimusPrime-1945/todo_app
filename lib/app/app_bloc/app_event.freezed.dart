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

  _AppLoadingEvent loading() {
    return const _AppLoadingEvent();
  }

  _AppAuthenticatedEvent authenticated(User user) {
    return _AppAuthenticatedEvent(
      user,
    );
  }
}

// ignore: unused_element
const $AppEvent = _$AppEventTearOff();

mixin _$AppEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result notAuthenticated(),
    @required Result loading(),
    @required Result authenticated(User user),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notAuthenticated(),
    Result loading(),
    Result authenticated(User user),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result notAuthenticated(_AppNotAuthenticatedEvent value),
    @required Result loading(_AppLoadingEvent value),
    @required Result authenticated(_AppAuthenticatedEvent value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notAuthenticated(_AppNotAuthenticatedEvent value),
    Result loading(_AppLoadingEvent value),
    Result authenticated(_AppAuthenticatedEvent value),
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

class _$_AppNotAuthenticatedEvent
    with DiagnosticableTreeMixin
    implements _AppNotAuthenticatedEvent {
  const _$_AppNotAuthenticatedEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.notAuthenticated()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AppEvent.notAuthenticated'));
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
    @required Result loading(),
    @required Result authenticated(User user),
  }) {
    assert(notAuthenticated != null);
    assert(loading != null);
    assert(authenticated != null);
    return notAuthenticated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notAuthenticated(),
    Result loading(),
    Result authenticated(User user),
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
    @required Result loading(_AppLoadingEvent value),
    @required Result authenticated(_AppAuthenticatedEvent value),
  }) {
    assert(notAuthenticated != null);
    assert(loading != null);
    assert(authenticated != null);
    return notAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notAuthenticated(_AppNotAuthenticatedEvent value),
    Result loading(_AppLoadingEvent value),
    Result authenticated(_AppAuthenticatedEvent value),
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

class _$_AppLoadingEvent
    with DiagnosticableTreeMixin
    implements _AppLoadingEvent {
  const _$_AppLoadingEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AppEvent.loading'));
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
    @required Result loading(),
    @required Result authenticated(User user),
  }) {
    assert(notAuthenticated != null);
    assert(loading != null);
    assert(authenticated != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notAuthenticated(),
    Result loading(),
    Result authenticated(User user),
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
    @required Result loading(_AppLoadingEvent value),
    @required Result authenticated(_AppAuthenticatedEvent value),
  }) {
    assert(notAuthenticated != null);
    assert(loading != null);
    assert(authenticated != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notAuthenticated(_AppNotAuthenticatedEvent value),
    Result loading(_AppLoadingEvent value),
    Result authenticated(_AppAuthenticatedEvent value),
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

class _$_AppAuthenticatedEvent
    with DiagnosticableTreeMixin
    implements _AppAuthenticatedEvent {
  const _$_AppAuthenticatedEvent(this.user) : assert(user != null);

  @override
  final User user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.authenticated(user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppEvent.authenticated'))
      ..add(DiagnosticsProperty('user', user));
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
    @required Result loading(),
    @required Result authenticated(User user),
  }) {
    assert(notAuthenticated != null);
    assert(loading != null);
    assert(authenticated != null);
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result notAuthenticated(),
    Result loading(),
    Result authenticated(User user),
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
    @required Result loading(_AppLoadingEvent value),
    @required Result authenticated(_AppAuthenticatedEvent value),
  }) {
    assert(notAuthenticated != null);
    assert(loading != null);
    assert(authenticated != null);
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result notAuthenticated(_AppNotAuthenticatedEvent value),
    Result loading(_AppLoadingEvent value),
    Result authenticated(_AppAuthenticatedEvent value),
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
