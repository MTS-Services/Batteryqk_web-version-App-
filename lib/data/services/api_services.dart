import 'dart:convert';
import 'package:batteryqk_web_app/common/widgets/show_snack_bar.dart';
import 'package:batteryqk_web_app/data/services/utility/urls.dart';
import 'package:batteryqk_web_app/features/authentication/models/build_listing_card_model.dart';
import 'package:batteryqk_web_app/features/authentication/models/user_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:batteryqk_web_app/features/authentication/controllers/auth_controller.dart';

import '../../features/authentication/models/user_data.dart';

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
        showSnackbar(context, "Failed", "User creation failed: ${response.statusCode}");
      }
    } catch (e) {
      showSnackbar(context, "Error", "An error occurred: $e");
    }
  }


  static Future<void> userLogIn(UserLogin userLogin, BuildContext context) async {
    final String url = Urls.userLogin;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userLogin.toJson()),
      );
      print("Response statusCode: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        final String token = responseBody['token'];

        await AuthController.saveToken(token);
        print('Token saved: $token');
        showSnackbar(context, "Success", "Login successful");
      } else {
        showSnackbar(context, "Failed", "Login failed: ${response.statusCode}");
      }
    } catch (e) {
      showSnackbar(context, "Error", "An error occurred: $e");
    }
  }

  Future<List<BuildListingCardModel>> showListing() async {
    final String url = Urls.showAllListing;
    final String? token = await AuthController.getToken();
    print('Retrieved token: $token');

    if (token == null || token.isEmpty) {
      throw Exception('Token is not available');
    }

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> listingData = jsonData['data']['listings'];
        return listingData.map((e) => BuildListingCardModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load listings: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
