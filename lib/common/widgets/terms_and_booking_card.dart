import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndBookingCard extends StatefulWidget {
  final VoidCallback? onSubmit;
  final VoidCallback? onCancel;

  const TermsAndBookingCard({
    Key? key,
    this.onSubmit,
    this.onCancel,
  }) : super(key: key);

  @override
  _TermsAndBookingCardState createState() => _TermsAndBookingCardState();
}

class _TermsAndBookingCardState extends State<TermsAndBookingCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'I agree to the terms and conditions\n',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const TextSpan(
                          text: 'By booking a session, you agree to our\n',
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of Service',
                          style: const TextStyle(
                            color:AppColor.blueColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            // Handle Terms of Service tap
                          },
                        ),
                        const TextSpan(
                          text: ' and ',
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(
                            color: AppColor.blueColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            // Handle Privacy Policy tap
                          },
                        ),
                        const TextSpan(text: '.'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Spacer(),
              OutlinedButton(
                onPressed: widget.onCancel,
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColor.blueColor,
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: isChecked ? widget.onSubmit : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Submit Booking',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 5),
            ],
          )
        ],
      ),
    );
  }
}
