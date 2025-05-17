import 'package:batteryqk_web_app/features/authentication/views/otp_verification_screen.dart';
import 'package:batteryqk_web_app/features/authentication/views/signup_screen.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../common/widgets/built_sccial_button.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Text(
                'Forgot Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'Enter Email Address',
                textAlign: TextAlign.center,
                style:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
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
              Center(
                child: Text(
                  'Back to sign in',
                  style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OtpVerificationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Send',
                    style:TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              //added line
              Center(
                child: Text(
                  'Or',
                  style: TextStyle(
                    color: AppColor.blackColor,
                    fontSize: 16,
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
              const SizedBox(height: 50),
              Text(
                'Do you have an account?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColor.blueColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Sign up',
                    style:TextStyle(fontSize: 18, color: AppColor.blueColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
