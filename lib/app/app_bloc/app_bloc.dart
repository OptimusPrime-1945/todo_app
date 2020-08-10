import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/User.dart';

import 'bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  @override
  AppState get initialState => AppState.started();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    yield* event.when(
      notAuthenticated: _mapNotAuthenticatedEventToState,
      authenticated: _mapAuthenticatedEventToState,
      loading: _mapLoadingState,
      error: _mapErrorEventToState,
      logging: _mapLoggingState,
    );
  }

  Stream<AppState> _mapLoadingState() async* {
    yield state.maybeMap(
      notAuthenticated: (state) =>
          state.copyWith(isLogin: false, msg: "Loading"),
      orElse: () => state,
    );
  }

  Stream<AppState> _mapNotAuthenticatedEventToState() async* {
    yield AppState.notAuthenticated(true, "nothing");
  }

  Stream<AppState> _mapAuthenticatedEventToState(User user) async* {
    yield AppState.authenticated(user: user);
  }

  Stream<AppState> _mapErrorEventToState(String msg) async* {
    yield AppState.showError(msg);
  }

  Stream<AppState> _mapLoggingState() async* {
    yield state.maybeMap(
      notAuthenticated: (state) =>
          state.copyWith(isLogin: false, msg: "Looging In"),
      orElse: () => state,
    );
  }
}
