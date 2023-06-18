import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/Model/user_model.dart';
import 'package:test_project/Service/api_component.dart';

class ApiService {
  static var client = http.Client();

  static handleLogin(Map<String, dynamic> body) async {
    var headers = {'Content-Type': 'application/json'};

    try {
      var response = await client.post(Uri.parse(ApiComponent.logInApi),
          body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        debugPrint("Login error : ${response.body}");
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Login error : $e");
      return 1;
    }
  }

  static  Future<dynamic> fetchUser()async{

      try {
        var response= await client.get(Uri.parse(ApiComponent.userListApi));

        if (response.statusCode == 200) {
          return userModelFromJson(response.body);
        } else {
          debugPrint("User fetch error : ${response.body}");
          return response.statusCode;
        }
      } on Exception catch (e) {
        return 1;
        // TODO
      }



  }
 }
