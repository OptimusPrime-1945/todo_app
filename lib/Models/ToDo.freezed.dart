// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

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

  _ToDo call(
      {String docId,
      String todoTitle,
      bool status,
      String description,
      String uid}) {
    return _ToDo(
      docId: docId,
      todoTitle: todoTitle,
      status: status,
      description: description,
      uid: uid,
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
      String uid});
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
  }) {
    return _then(_value.copyWith(
      docId: docId == freezed ? _value.docId : docId as String,
      todoTitle: todoTitle == freezed ? _value.todoTitle : todoTitle as String,
      status: status == freezed ? _value.status : status as bool,
      description:
          description == freezed ? _value.description : description as String,
      uid: uid == freezed ? _value.uid : uid as String,
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
      String uid});
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
  }) {
    return _then(_ToDo(
      docId: docId == freezed ? _value.docId : docId as String,
      todoTitle: todoTitle == freezed ? _value.todoTitle : todoTitle as String,
      status: status == freezed ? _value.status : status as bool,
      description:
          description == freezed ? _value.description : description as String,
      uid: uid == freezed ? _value.uid : uid as String,
    ));
  }
}

@JsonSerializable()
class _$_ToDo with DiagnosticableTreeMixin implements _ToDo {
  const _$_ToDo(
      {this.docId, this.todoTitle, this.status, this.description, this.uid});

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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToDo(docId: $docId, todoTitle: $todoTitle, status: $status, description: $description, uid: $uid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToDo'))
      ..add(DiagnosticsProperty('docId', docId))
      ..add(DiagnosticsProperty('todoTitle', todoTitle))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('uid', uid));
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
                const DeepCollectionEquality().equals(other.uid, uid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(docId) ^
      const DeepCollectionEquality().hash(todoTitle) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(uid);

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
      String uid}) = _$_ToDo;

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
  _$ToDoCopyWith<_ToDo> get copyWith;
}
