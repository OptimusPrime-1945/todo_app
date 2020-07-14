import 'package:meta/meta.dart';

@immutable
abstract class TodoState {}

class InitialTodoState extends TodoState {}
