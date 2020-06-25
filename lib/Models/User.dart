import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'User.freezed.dart';

part 'User.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @required String name,
    @required String uid,
    @required String email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

//
//import 'package:flutter/material.dart';
//
//class User {
//  final String uid;
//  final String name;
//  final String email;
//
//  User({@required this.uid,@required  this.name,@required  this.email});
//}
