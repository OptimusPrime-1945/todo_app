part of 'app_cubit.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState.notAuthenticated({bool isLogin, String msg}) =
      _AppNotAuthenticatedState;

  const factory AppState.authenticated({@required User user}) =
      _AppAuthenticatedState;

  const factory AppState.loading() = _AppLoadingState;

  const factory AppState.started() = _AppStartedState;

  const factory AppState.showError({String msg}) = _AppErrorState;
}
