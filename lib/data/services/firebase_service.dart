import 'package:batteryqk_web_app/common/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../common/widgets/custom_bottom_navigation_bar.dart';

class AuthControllers extends GetxController {
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

  Future<bool> signUp(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      showSnackbar(context, "Success", "Account created successfully".tr);
      return true;
    } catch (e) {
      showSnackbar(context, 'Sign Up Error'.tr, e.toString().split('] ').last);
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      showSnackbar(context, 'success'.tr, 'login_success'.tr);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'The email address is not valid.'.tr;
          break;
        case 'user-not-found':
          errorMessage = 'No account found with this email.'.tr;
          break;
        case 'wrong-password':
          errorMessage = 'The password you entered is incorrect.'.tr;
          break;
        default:
          errorMessage = 'Login failed. Please try again.'.tr;
      }
      showSnackbar(context, 'Sign In Error'.tr, errorMessage);
    } catch (e) {
      showSnackbar(
        context,
        'Error'.tr,
        'Something went wrong. Please try again later.'.tr,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logOut(BuildContext context) async {
    try {
      isLoading.value = true;
      await _auth.signOut();
    } catch (e) {
      showSnackbar(context, 'Logout Error'.tr, e.toString().split('] ').last);
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
        showSnackbar(
          Get.context!,
          'Cancelled'.tr,
          'Google sign-in was cancelled'.tr,
        );
        return false;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      if (googleAuth.accessToken == null) {
        showSnackbar(Get.context!, 'Error'.tr, 'Missing access token'.tr);
        return false;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user != null) {
        showSnackbar(Get.context!, 'Success'.tr, 'Logged in with Google'.tr);
        Get.offAll(() => CustomBottomNavigationBar());
        return true;
      } else {
        showSnackbar(Get.context!, 'Error'.tr, 'Failed to retrieve user'.tr);
        return false;
      }
    } catch (e) {
      showSnackbar(Get.context!, 'Google Sign-In Error'.tr, e.toString());
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

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        oauthCredential,
      );
      print("✅ Apple Sign-In Successful: ${userCredential.user?.email}");
      return userCredential;
    } catch (e) {
      print("❌ Apple Sign-In Error: $e");
      return null;
    }
  }
}
