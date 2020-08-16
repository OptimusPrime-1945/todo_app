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
    createdDateTime: json['createdDateTime'] == null
        ? null
        : DateTime.parse(json['createdDateTime'] as String),
    endingDateTime: json['endingDateTime'] == null
        ? null
        : DateTime.parse(json['endingDateTime'] as String),
  );
}

Map<String, dynamic> _$_$_ToDoToJson(_$_ToDo instance) => <String, dynamic>{
      'docId': instance.docId,
      'todoTitle': instance.todoTitle,
      'status': instance.status,
      'description': instance.description,
      'uid': instance.uid,
      'createdDateTime': instance.createdDateTime?.toIso8601String(),
      'endingDateTime': instance.endingDateTime?.toIso8601String(),
    };
