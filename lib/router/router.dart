import 'package:auto_route/auto_route_annotations.dart';
import 'package:todoapps/Authentication/SignIn.dart';
import 'package:todoapps/Authentication/Wrapper.dart';
import 'package:todoapps/Widgets/Loading.dart';
import 'package:todoapps/app_screens/home.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  Wrapper wrapper;
  Home home;
  Loading loading;
  SignIn signIn;
}
