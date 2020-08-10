import 'package:freezed_annotation/freezed_annotation.dart';

part 'User.freezed.dart';

part 'User.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @required String uid,
    String name,
    String email,
    String imageURL,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
