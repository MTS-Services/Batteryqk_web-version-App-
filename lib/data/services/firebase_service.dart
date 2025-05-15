import 'package:batteryqk_web_app/common/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}
