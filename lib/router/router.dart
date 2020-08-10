import 'package:auto_route/auto_route_annotations.dart';
import 'package:todo_app/app_screens/initial_page.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  InitialPage initialPage;
}
