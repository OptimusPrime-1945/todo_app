// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ToDo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ToDo _$ToDoFromJson(Map<String, dynamic> json) {
  return _ToDo.fromJson(json);
}

class _$ToDoTearOff {
  const _$ToDoTearOff();

// ignore: unused_element
  _ToDo call(
      {String docId,
      String todoTitle,
      bool status,
      String description,
      String uid,
      DateTime createdDateTime,
      DateTime endingDateTime}) {
    return _ToDo(
      docId: docId,
      todoTitle: todoTitle,
      status: status,
      description: description,
      uid: uid,
      createdDateTime: createdDateTime,
      endingDateTime: endingDateTime,
    );
  }
}

// ignore: unused_element
const $ToDo = _$ToDoTearOff();

mixin _$ToDo {
  String get docId;
  String get todoTitle;
  bool get status;
  String get description;
  String get uid;
  DateTime get createdDateTime;
  DateTime get endingDateTime;

  Map<String, dynamic> toJson();
  $ToDoCopyWith<ToDo> get copyWith;
}

abstract class $ToDoCopyWith<$Res> {
  factory $ToDoCopyWith(ToDo value, $Res Function(ToDo) then) =
      _$ToDoCopyWithImpl<$Res>;
  $Res call(
      {String docId,
      String todoTitle,
      bool status,
      String description,
      String uid,
      DateTime createdDateTime,
      DateTime endingDateTime});
}

class _$ToDoCopyWithImpl<$Res> implements $ToDoCopyWith<$Res> {
  _$ToDoCopyWithImpl(this._value, this._then);

  final ToDo _value;
  // ignore: unused_field
  final $Res Function(ToDo) _then;

  @override
  $Res call({
    Object docId = freezed,
    Object todoTitle = freezed,
    Object status = freezed,
    Object description = freezed,
    Object uid = freezed,
    Object createdDateTime = freezed,
    Object endingDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      docId: docId == freezed ? _value.docId : docId as String,
      todoTitle: todoTitle == freezed ? _value.todoTitle : todoTitle as String,
      status: status == freezed ? _value.status : status as bool,
      description:
          description == freezed ? _value.description : description as String,
      uid: uid == freezed ? _value.uid : uid as String,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime as DateTime,
      endingDateTime: endingDateTime == freezed
          ? _value.endingDateTime
          : endingDateTime as DateTime,
    ));
  }
}

abstract class _$ToDoCopyWith<$Res> implements $ToDoCopyWith<$Res> {
  factory _$ToDoCopyWith(_ToDo value, $Res Function(_ToDo) then) =
      __$ToDoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String docId,
      String todoTitle,
      bool status,
      String description,
      String uid,
      DateTime createdDateTime,
      DateTime endingDateTime});
}

class __$ToDoCopyWithImpl<$Res> extends _$ToDoCopyWithImpl<$Res>
    implements _$ToDoCopyWith<$Res> {
  __$ToDoCopyWithImpl(_ToDo _value, $Res Function(_ToDo) _then)
      : super(_value, (v) => _then(v as _ToDo));

  @override
  _ToDo get _value => super._value as _ToDo;

  @override
  $Res call({
    Object docId = freezed,
    Object todoTitle = freezed,
    Object status = freezed,
    Object description = freezed,
    Object uid = freezed,
    Object createdDateTime = freezed,
    Object endingDateTime = freezed,
  }) {
    return _then(_ToDo(
      docId: docId == freezed ? _value.docId : docId as String,
      todoTitle: todoTitle == freezed ? _value.todoTitle : todoTitle as String,
      status: status == freezed ? _value.status : status as bool,
      description:
          description == freezed ? _value.description : description as String,
      uid: uid == freezed ? _value.uid : uid as String,
      createdDateTime: createdDateTime == freezed
          ? _value.createdDateTime
          : createdDateTime as DateTime,
      endingDateTime: endingDateTime == freezed
          ? _value.endingDateTime
          : endingDateTime as DateTime,
    ));
  }
}

@JsonSerializable()
class _$_ToDo implements _ToDo {
  const _$_ToDo(
      {this.docId,
      this.todoTitle,
      this.status,
      this.description,
      this.uid,
      this.createdDateTime,
      this.endingDateTime});

  factory _$_ToDo.fromJson(Map<String, dynamic> json) =>
      _$_$_ToDoFromJson(json);

  @override
  final String docId;
  @override
  final String todoTitle;
  @override
  final bool status;
  @override
  final String description;
  @override
  final String uid;
  @override
  final DateTime createdDateTime;
  @override
  final DateTime endingDateTime;

  @override
  String toString() {
    return 'ToDo(docId: $docId, todoTitle: $todoTitle, status: $status, description: $description, uid: $uid, createdDateTime: $createdDateTime, endingDateTime: $endingDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ToDo &&
            (identical(other.docId, docId) ||
                const DeepCollectionEquality().equals(other.docId, docId)) &&
            (identical(other.todoTitle, todoTitle) ||
                const DeepCollectionEquality()
                    .equals(other.todoTitle, todoTitle)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.createdDateTime, createdDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.createdDateTime, createdDateTime)) &&
            (identical(other.endingDateTime, endingDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.endingDateTime, endingDateTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(docId) ^
      const DeepCollectionEquality().hash(todoTitle) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(createdDateTime) ^
      const DeepCollectionEquality().hash(endingDateTime);

  @override
  _$ToDoCopyWith<_ToDo> get copyWith =>
      __$ToDoCopyWithImpl<_ToDo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ToDoToJson(this);
  }
}

abstract class _ToDo implements ToDo {
  const factory _ToDo(
      {String docId,
      String todoTitle,
      bool status,
      String description,
      String uid,
      DateTime createdDateTime,
      DateTime endingDateTime}) = _$_ToDo;

  factory _ToDo.fromJson(Map<String, dynamic> json) = _$_ToDo.fromJson;

  @override
  String get docId;
  @override
  String get todoTitle;
  @override
  bool get status;
  @override
  String get description;
  @override
  String get uid;
  @override
  DateTime get createdDateTime;
  @override
  DateTime get endingDateTime;
  @override
  _$ToDoCopyWith<_ToDo> get copyWith;
}
