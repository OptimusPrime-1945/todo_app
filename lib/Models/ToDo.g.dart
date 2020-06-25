// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ToDo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ToDo _$_$_ToDoFromJson(Map<String, dynamic> json) {
  return _$_ToDo(
    docId: json['docId'] as String,
    todoTitle: json['todoTitle'] as String,
    status: json['status'] as bool,
    description: json['description'] as String,
    uid: json['uid'] as String,
  );
}

Map<String, dynamic> _$_$_ToDoToJson(_$_ToDo instance) => <String, dynamic>{
      'docId': instance.docId,
      'todoTitle': instance.todoTitle,
      'status': instance.status,
      'description': instance.description,
      'uid': instance.uid,
    };
