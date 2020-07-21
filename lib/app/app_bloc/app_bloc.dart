import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:todoapps/Models/User.dart';

import 'bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  @override
  AppState get initialState => AppState.started();

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    yield* event.when(
      notAuthenticated: _mapNotAuthenticatedEventToState,
      loading: _mapToLoadingState,
      authenticated: _mapToAuthenticatedState,
    );
  }


  Stream<AppState> _mapNotAuthenticatedEventToState() async* {
    yield AppState.notAuthenticated(true, "Nothing");
  }

  Stream<AppState> _mapToLoadingState() async* {
    yield state.maybeMap(
      notAuthenticated: (state) =>
          state.copyWith(isLogin: false, msg: "Loading"),
      orElse: () => state,
    );
  }

  Stream<AppState> _mapToAuthenticatedState(User user) async* {
    yield AppState.authenticated(user: user);
  }
}
