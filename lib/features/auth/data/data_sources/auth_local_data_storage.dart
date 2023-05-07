import 'dart:convert';

import 'package:ui_one/core/library/local_storage.dart';

abstract class AuthLocalDataSource {
  factory AuthLocalDataSource({required LocalStoage stoage}) =>
      AuthLocalDataSourceImple(stoage: stoage);

  Map<String, Object> signUp(String email, Map<String, Object> data);
  Map<String, Object> signIn(String email, String password);
}

class AuthLocalDataSourceImple implements AuthLocalDataSource {
  final LocalStoage stoage;

  AuthLocalDataSourceImple({required this.stoage});

  @override
  Map<String, Object> signUp(String email, Map<String, Object> data) {
    String json = jsonEncode(data);
    bool isSuccess = stoage.createData(key: email, value: json);
    return {
      "message": "Succesfuly Created",
      "success": isSuccess,
      "data": "no-data",
    };
  }

  @override
  Map<String, Object> signIn(String email, String password) {
    String? getUser = stoage.readData(key: email);
    if (getUser == null) {
      return {
        "message": "User Not Found !!",
        "success": false,
        "data": "no-data",
      };
    }

    Map<String, Object?> json = jsonDecode(getUser) as Map<String, Object?>;
    if (json["password"] == password) {
      return {
        "message": "Succesfuly Logged In !!",
        "success": true,
        "data": "no_data",
      };
    }else {
       return {
        "message": "Wrong Password !!",
        "success": false,
        "data": "no_data",
      };
    }
  }
}
