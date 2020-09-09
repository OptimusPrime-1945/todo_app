import 'package:cloud_firestore/cloud_firestore.dart';
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

extension DocumentModel on DocumentSnapshot {
  ToDo asToDo() {
    var document = this.data();
    if (document == null) return null;
    document.update('createdDateTime',
        (value) => document['createdDateTime'].toDate().toString());
    document.update('endingDateTime',
        (value) => document['endingDateTime'].toDate().toString());
    return ToDo.fromJson(document);
  }
}
