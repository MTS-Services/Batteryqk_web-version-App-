import 'dart:convert';
import 'package:batteryqk_web_app/common/widgets/show_snack_bar.dart';
import 'package:batteryqk_web_app/data/services/utility/urls.dart';
import 'package:batteryqk_web_app/features/authentication/models/user_data.dart';
import 'package:batteryqk_web_app/features/authentication/models/user_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<void> createUser(UserCreate user, BuildContext context) async {
    final String url = Urls.userCreate;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );
      print("Response statusCode: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        showSnackbar(context, "Success", "User created successfully");
      } else {
        showSnackbar(
          context,
          "Failed",
          "User creation failed: ${response.statusCode}",
        );
      }
    } catch (e) {
      showSnackbar(context, "Error", "An error occurred: $e");
    }
  }

  static Future<void> userLogIn(UserLogin userLogin, BuildContext context) async {
    final String url = Urls.userLogin;
    try{
      final response = await http.post(
        Uri.parse(url),
        headers:{'Content-Type' : 'application/json'},
        body: jsonEncode(userLogin.toJson())
      );
      print("Response statusCode : ${response.statusCode}");
      print("Response Body : ${response.body}");

      if(response.statusCode == 200 || response.statusCode ==201){
        showSnackbar(context, "Success", "Login successful");
      }else{
        showSnackbar(context, "Failed", "Login failed: ${response.statusCode}");
      }
    }catch(e){
      showSnackbar(context, "Error", "An error occurred: $e");
    }
  }
}
