import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todoapps/Authentication/AuthProvider.dart';
import 'package:todoapps/Authentication/AuthService.dart';
import 'package:todoapps/Models/User.dart';
import 'package:todoapps/app/app_bloc/app_bloc.dart';
import 'package:todoapps/router/router.gr.dart';

class TODO extends StatefulWidget {
  @override
  _TODOState createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: BlocProvider<AppBloc>(
        create: (_) => AppBloc(),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthProvider>(
              create: (BuildContext context) => AuthProvider(
                appBloc: BlocProvider.of<AppBloc>(context),
                authService: AuthService(),
              ),
            ),
          ],
          child: MaterialApp(
            home: ExtendedNavigator<Router>(
              router: Router(),
            ),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.blue,
              accentColor: Colors.blueAccent,
              buttonColor: Colors.blue,
              buttonTheme: const ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                buttonColor: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
