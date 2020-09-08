import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ToDo.freezed.dart';
part 'ToDo.g.dart';

@freezed
abstract class ToDo with _$ToDo {
  const factory ToDo({
    String docId,
    String todoTitle,
    bool status,
    String description,
    String uid,
    DateTime createdDateTime,
    DateTime endingDateTime,
  }) = _ToDo;

  factory ToDo.fromJson(Map<String, dynamic> json) => _$ToDoFromJson(json);
}
