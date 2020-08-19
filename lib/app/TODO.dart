import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/app_bloc/app_bloc.dart';
import 'package:todo_app/providers/auth_provider.dart';
import 'package:todo_app/router/router.gr.dart';
import 'package:todo_app/services/auth_service.dart';

class TODO extends StatefulWidget {
  @override
  _TODOState createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthService>(
          create: (context) => AuthService(),
        ),
      ],
      child: BlocProvider<AppBloc>(
        create: (_) => AppBloc(),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthProvider>(
              create: (context) => AuthProvider(
                appBloc: BlocProvider.of<AppBloc>(context),
                authService: AuthService(),
              ),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Todo app",
            theme: ThemeData(
              primaryColor: Colors.blue,
              accentColor: Colors.blueAccent,
              buttonTheme: const ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                buttonColor: Colors.blue,
              ),
            ),
            home: ExtendedNavigator<Router>(
              router: Router(),
            ),
          ),
        ),
      ),
    );
  }
}
