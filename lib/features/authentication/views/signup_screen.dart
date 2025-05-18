import 'package:get/get.dart'; // add for .tr
import 'package:batteryqk_web_app/common/widgets/custom_text_buttom.dart';
import 'package:batteryqk_web_app/features/authentication/views/login_screen.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../common/widgets/built_sccial_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                Text(
                  'create_account'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackColor,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'create_account_subtitle'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  controller: _emailTEController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'email_required'.tr;
                    }
                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return 'email_invalid'.tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'email'.tr,
                    filled: true,
                    fillColor: Colors.blue.shade50,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.blueColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordTEController,
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password_required'.tr;
                    }
                    if (value.length < 6) {
                      return 'password_length'.tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'password'.tr,
                    filled: true,
                    fillColor: Colors.blue.shade50,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.blueColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColor.blueColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _confirmPTEController,
                  obscureText: _obscureConfirmPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'confirm_password_required'.tr;
                    }
                    if (value != _passwordTEController.text) {
                      return 'passwords_not_match'.tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'confirm_password'.tr,
                    filled: true,
                    fillColor: Colors.blue.shade50,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.blueColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColor.blueColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'sign_up'.tr,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: MyCustomTextButton(
                    text: 'already_have_account'.tr,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                  child: Text(
                    'or_continue_with'.tr,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildSocialButton(
                      icon: FontAwesomeIcons.google,
                      onTap: () {
                        // Handle Google login
                      },
                    ),
                    SizedBox(width: 16),
                    buildSocialButton(
                      icon: FontAwesomeIcons.facebook,
                      onTap: () {
                        // Handle Facebook login
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
