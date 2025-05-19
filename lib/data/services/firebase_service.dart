import 'package:batteryqk_web_app/common/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    } catch (e) {
      showSnackbar(context, 'Sign In Error', e.toString().split('] ').last);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logOut(BuildContext context) async {
    try {
      isLoading.value = true;
      await _auth.signOut();
      showSnackbar(context, 'Logged Out', 'You have been signed out');
    } catch (e) {
      showSnackbar(context, 'Logout Error', e.toString().split('] ').last);
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> googleSignIn() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {

        showSnackbar(Get.context!, 'Cancelled', 'Google sign-in was cancelled');
        return false;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      print("User signed in with Google: ${_auth.currentUser?.email}");

      showSnackbar(Get.context!, 'Success', 'Logged in with Google');
      return true;
    } catch (e) {
      print("Google Sign-In Error: $e");
      showSnackbar(Get.context!, 'Error', 'Google sign-in failed. Please try again.');
      return false;
    }
  }

}
