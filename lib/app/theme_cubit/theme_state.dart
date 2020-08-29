part of 'theme_cubit.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState.currentTheme({@required AppTheme appTheme}) =
      _ThemeStateCurrentTheme;
}
