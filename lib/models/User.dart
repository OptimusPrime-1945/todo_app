import 'package:firebase_auth/firebase_auth.dart' as _auth;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'User.freezed.dart';
part 'User.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @required String uid,
    String name,
    String email,
    String photoURL,
    DateTime registeredTime,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
extension UserExtension on _auth.User {
  User asUser() {
    return User(
      uid: this.uid,
      name: this.displayName,
      email: this.email,
      photoURL: this.photoURL,
    );
  }
}
