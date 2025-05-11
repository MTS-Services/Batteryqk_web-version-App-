import 'package:batteryqk_web_app/common/widgets/custom_app_bar.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';

class Faqs extends StatelessWidget {
  const Faqs({super.key});

  final List<Map<String, String>> faqData = const [
    {
      'question': 'How can I book a session?',
      'answer':
          'Visit the booking page, fill out the form, and click "Submit Booking".',
    },
    {
      'question': 'Can I cancel or reschedule a session?',
      'answer':
          'Yes, you can cancel or reschedule up to 24 hours before the session.',
    },
    {
      'question': 'What payment methods do you accept?',
      'answer':
          'We accept credit cards, debit cards, and secure online transfers.',
    },
    {
      'question': 'Is there a refund policy?',
      'answer':
          'Refunds are offered for cancellations made at least 24 hours in advance.',
    },
    {
      'question': 'How do I contact support?',
      'answer':
          'You can reach support via our Contact page or by emailing support@example.com.',
    },
    {
      'question': 'Are there any discounts for group bookings?',
      'answer':
          'Yes, we offer discounts for bookings with 3 or more participants.',
    },
    {
      'question': 'Can I attend sessions without registering?',
      'answer':
          'Registration is required for all sessions to ensure space availability.',
    },
    {
      'question': 'Do you provide equipment?',
      'answer':
          'Basic equipment is provided for most sessions, but check details when booking.',
    },
    {
      'question': 'Are sessions suitable for beginners?',
      'answer':
          'Yes, we offer beginner-friendly sessions across all categories.',
    },
    {
      'question': 'What happens if a session is canceled by the academy?',
      'answer':
          'You will be notified immediately and offered a reschedule or full refund.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(isBack: true),
      ),
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            ...faqData.map((faq) {
              return Card(
                color: const Color.fromARGB(255, 240, 240, 240),

                elevation: 0,
                margin: const EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: AppColor.whiteColor),
                ),
                child: ExpansionTile(
                  title: Text(
                    faq['question']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        faq['answer']!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
