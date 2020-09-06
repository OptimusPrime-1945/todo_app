// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'theme_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ThemeStateTearOff {
  const _$ThemeStateTearOff();

// ignore: unused_element
  _ThemeStateCurrentTheme currentTheme({@required AppTheme appTheme}) {
    return _ThemeStateCurrentTheme(
      appTheme: appTheme,
    );
  }
}

// ignore: unused_element
const $ThemeState = _$ThemeStateTearOff();

mixin _$ThemeState {
  AppTheme get appTheme;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result currentTheme(AppTheme appTheme),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result currentTheme(AppTheme appTheme),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result currentTheme(_ThemeStateCurrentTheme value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result currentTheme(_ThemeStateCurrentTheme value),
    @required Result orElse(),
  });

  $ThemeStateCopyWith<ThemeState> get copyWith;
}

abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res>;
  $Res call({AppTheme appTheme});
}

class _$ThemeStateCopyWithImpl<$Res> implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  final ThemeState _value;
  // ignore: unused_field
  final $Res Function(ThemeState) _then;

  @override
  $Res call({
    Object appTheme = freezed,
  }) {
    return _then(_value.copyWith(
      appTheme: appTheme == freezed ? _value.appTheme : appTheme as AppTheme,
    ));
  }
}

abstract class _$ThemeStateCurrentThemeCopyWith<$Res>
    implements $ThemeStateCopyWith<$Res> {
  factory _$ThemeStateCurrentThemeCopyWith(_ThemeStateCurrentTheme value,
          $Res Function(_ThemeStateCurrentTheme) then) =
      __$ThemeStateCurrentThemeCopyWithImpl<$Res>;
  @override
  $Res call({AppTheme appTheme});
}

class __$ThemeStateCurrentThemeCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res>
    implements _$ThemeStateCurrentThemeCopyWith<$Res> {
  __$ThemeStateCurrentThemeCopyWithImpl(_ThemeStateCurrentTheme _value,
      $Res Function(_ThemeStateCurrentTheme) _then)
      : super(_value, (v) => _then(v as _ThemeStateCurrentTheme));

  @override
  _ThemeStateCurrentTheme get _value => super._value as _ThemeStateCurrentTheme;

  @override
  $Res call({
    Object appTheme = freezed,
  }) {
    return _then(_ThemeStateCurrentTheme(
      appTheme: appTheme == freezed ? _value.appTheme : appTheme as AppTheme,
    ));
  }
}

class _$_ThemeStateCurrentTheme implements _ThemeStateCurrentTheme {
  const _$_ThemeStateCurrentTheme({@required this.appTheme})
      : assert(appTheme != null);

  @override
  final AppTheme appTheme;

  @override
  String toString() {
    return 'ThemeState.currentTheme(appTheme: $appTheme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ThemeStateCurrentTheme &&
            (identical(other.appTheme, appTheme) ||
                const DeepCollectionEquality()
                    .equals(other.appTheme, appTheme)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(appTheme);

  @override
  _$ThemeStateCurrentThemeCopyWith<_ThemeStateCurrentTheme> get copyWith =>
      __$ThemeStateCurrentThemeCopyWithImpl<_ThemeStateCurrentTheme>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result currentTheme(AppTheme appTheme),
  }) {
    assert(currentTheme != null);
    return currentTheme(appTheme);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result currentTheme(AppTheme appTheme),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (currentTheme != null) {
      return currentTheme(appTheme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result currentTheme(_ThemeStateCurrentTheme value),
  }) {
    assert(currentTheme != null);
    return currentTheme(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result currentTheme(_ThemeStateCurrentTheme value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (currentTheme != null) {
      return currentTheme(this);
    }
    return orElse();
  }
}

abstract class _ThemeStateCurrentTheme implements ThemeState {
  const factory _ThemeStateCurrentTheme({@required AppTheme appTheme}) =
      _$_ThemeStateCurrentTheme;

  @override
  AppTheme get appTheme;
  @override
  _$ThemeStateCurrentThemeCopyWith<_ThemeStateCurrentTheme> get copyWith;
}
