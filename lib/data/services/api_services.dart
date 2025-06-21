import 'dart:convert';
import 'package:batteryqk_web_app/common/widgets/show_snack_bar.dart';
import 'package:batteryqk_web_app/data/services/utility/urls.dart';
import 'package:batteryqk_web_app/features/authentication/models/build_listing_card_model.dart';
import 'package:batteryqk_web_app/features/authentication/models/user_data.dart';
import 'package:batteryqk_web_app/features/authentication/models/user_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:batteryqk_web_app/features/authentication/controllers/auth_controller.dart'; // Import the AuthController

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

  static Future<void> userLogIn(
    UserLogin userLogin,
    BuildContext context,
  ) async {
    final String url = Urls.userLogin;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userLogin.toJson()),
      );
      print("Response statusCode : ${response.statusCode}");
      print("Response Body : ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        final String token = responseBody['token'];  // Retrieve token from response

        // Save the token in SharedPreferences
        await AuthController.saveToken(token);
        print('Token saved: $token');  // Debugging: Confirm the token is saved
        
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

  // Retrieve the token from SharedPreferences
  final String? token = await AuthController.getToken();
  print('Retrieved token: $token');  // Debugging: Confirm token retrieval

  if (token == null || token.isEmpty) {
    throw Exception('Token is not available');
  }

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',  // Send token in the header
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      if (jsonData.containsKey('data') && jsonData['data'] != null) {
        final List<dynamic> listingData = jsonData['data']['listings'];
        return listingData
            .map((listing) => BuildListingCardModel.fromJson(listing))
            .toList();
      } else {
        throw Exception('No listings data found');
      }
    } else {
      throw Exception('Failed to load listings: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('An error occurred: $e');
  }
}

Future<void> makeBooking({
  required int listingId,
  required String bookingDate,
  required String bookingHours,
  required int numberOfPersons,
  required String additionalNote,
  required BuildContext context,
}) async {
  final String url = Urls.booking;
  final Map<String, dynamic> bookingData = {
    "listingId": listingId,
    "bookingDate": bookingDate,
    "booking_hours": bookingHours,
    "numberOfPersons": numberOfPersons,
    "additionalNote": additionalNote,
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(bookingData),
    );

    // Check if the response is successful
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      // Handle success
      if (responseData['success'] == true) {
        // Show success message
        final message = responseData['data']['message'];
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Booking Successful'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Handle failure
        final message = responseData['message'] ?? "Failed to create booking";
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Booking Failed'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      // Handle non-200 status code
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Error'),
          content: Text('Something went wrong. Please try again later.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  } catch (e) {
    // Handle error
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Error'),
        content: Text('An error occurred: $e'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}


}
