import 'package:batteryqk_web_app/common/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../common/widgets/custom_bottom_navigation_bar.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> firebaseUser = Rxn<User>();
  RxBool isLoggedIn = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());

    ever(firebaseUser, (User? user) {
      isLoggedIn.value = user != null;
    });
  }

  Future<bool> signUp(String email, String password, BuildContext context) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      showSnackbar(context, "Success", "Account created successfully");
      return true;
    } catch (e) {
      showSnackbar(context, 'Sign Up Error', e.toString().split('] ').last);
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signIn(String email, String password, BuildContext context) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      showSnackbar(context, 'Success', 'Logged in successfully');
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'user-not-found':
          errorMessage = 'No account found with this email.';
          break;
        case 'wrong-password':
          errorMessage = 'The password you entered is incorrect.';
          break;
        default:
          errorMessage = 'Login failed. Please try again.';
      }
      showSnackbar(context, 'Sign In Error', errorMessage);
    } catch (e) {
      showSnackbar(context, 'Error', 'Something went wrong. Please try again later.');
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> logOut(BuildContext context) async {
    try {
      isLoading.value = true;
      await _auth.signOut();
    } catch (e) {
      showSnackbar(context, 'Logout Error', e.toString().split('] ').last);
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> googleSignIn() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        showSnackbar(Get.context!, 'Cancelled', 'Google sign-in was cancelled');
        return false;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.accessToken == null) {
        showSnackbar(Get.context!, 'Error', 'Missing access token');
        return false;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user != null) {
        showSnackbar(Get.context!, 'Success', 'Logged in with Google');
        Get.offAll(() => CustomBottomNavigationBar());
        return true;
      } else {
        showSnackbar(Get.context!, 'Error', 'Failed to retrieve user');
        return false;
      }
    } catch (e) {
      showSnackbar(Get.context!, 'Google Sign-In Error', e.toString());
      return false;
    }
  }



  Future<UserCredential?> signInWithApple() async {
    try {

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Apple credential থেকে Firebase OAuth credential তৈরি
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      // Firebase login
      final userCredential = await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      print("✅ Apple Sign-In Successful: ${userCredential.user?.email}");
      return userCredential;

    } catch (e) {
      print("❌ Apple Sign-In Error: $e");
      return null;
    }
  }


}
