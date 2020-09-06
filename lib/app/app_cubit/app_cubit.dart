import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/models/User.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.started());

  notAuthenticated({@required bool isLogin, @required String msg}) {
    emit(AppState.notAuthenticated(isLogin: isLogin, msg: msg));
  }

  showError({@required String msg}) {
    emit(AppState.showError(msg: msg));
  }

  authenticated({@required User user}) {
    emit(AppState.authenticated(user: user));
  }

  loading() {
    emit(AppState.loading());
  }
}
