import 'package:auto_route/auto_route_annotations.dart';
import 'package:todo_app/app_screens/initial_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: InitialPage, initial: true),
  ],
)
class $Router {}
