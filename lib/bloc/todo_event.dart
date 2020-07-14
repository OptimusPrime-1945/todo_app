import 'package:meta/meta.dart';
import 'package:todoapps/Models/ToDo.dart';

@immutable
abstract class TodoEvent  {
}

class GetTodo extends TodoEvent{
  final ToDo toDo;

  GetTodo({this.toDo});
}
