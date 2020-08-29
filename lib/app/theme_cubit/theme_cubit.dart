import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:theme_provider/theme_provider.dart';

part 'theme_cubit.freezed.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  AppTheme appTheme;

  ThemeCubit({this.appTheme})
      : super(ThemeState.currentTheme(appTheme: appTheme));

  themeChanger() {
    this.appTheme.id == 'light'
        ? appTheme = AppTheme.dark(id: 'dark')
        : appTheme = AppTheme.light(id: 'light');
    emit(ThemeState.currentTheme(appTheme: appTheme));
  }
}
