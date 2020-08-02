import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoapps/Models/User.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState.notAuthenticated(bool isLogin, String msg) =
      _AppNotAuthenticatedState;

  const factory AppState.authenticated({@required User user}) =
  _AppAuthenticatedState;

  const factory AppState.started() = _AppStartedState;

  const factory AppState.showError(String msg) = _AppErrorState;
}
