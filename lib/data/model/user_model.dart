import 'package:xpenso/data/local/db_helper.dart';

class UserModel {
  int? uid;
  String name;
  String email;
  String password;
  String mobNo;
  String createdAt;

  UserModel({this.uid,
      required this.name,
      required this.email,
      required this.password,
      required this.mobNo,
      required this.createdAt
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      createdAt: map[DbHelper.USER_CREATED_AT],
      uid: map[DbHelper.USER_ID],
      name: map[DbHelper.USER_NAME],
      email: map[DbHelper.USER_EMAIL],
      password: map[DbHelper.USER_PASSWORD],
      mobNo: map[DbHelper.USER_MOBILE],
    );
  }


  Map<String, dynamic> toMap() {
    return {
      DbHelper.USER_NAME: name,
      DbHelper.USER_EMAIL: email,
      DbHelper.USER_PASSWORD: password,
      DbHelper.USER_MOBILE: mobNo,
      DbHelper.USER_CREATED_AT: createdAt,
    };
  }

}
