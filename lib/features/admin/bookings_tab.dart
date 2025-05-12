import 'package:flutter/material.dart';

class BookingsTab extends StatelessWidget {
  const BookingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
          title: const Text("Bookings")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Booking Management",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Color(
            0xFF1F2937)),),
            const SizedBox(height: 10,),
            Row(
              children: [
              _headCall(text: "ID",),
              _headCall(text: "User",),
              _headCall(text: "Academy",),
              _headCall(text: "Date & Time",),
              _headCall(text: "Status",),
              _headCall(text: "Payment",),
              _headCall(text: "Actions",),
              ],
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                return  Card(
                  elevation: 0.5,
                  shadowColor: Colors.white.withOpacity(0.7),
                  color: Colors.white,
                  child: Row(
                      children: [
                        _headCall( text: index.toString(), ),
                        _headCall(text: 'Remon', ),
                        _headCall(text: 'dfasdfdas',),
                        _headCall( text: '5/12/25',),
                        _headCall( text: 'Confirm', ),
                        _headCall( text: 'Unpaid', ),
                        _headCall( text: 'Success', ),
                      ],

                  ),
                );
              },),
            )
          ],
        ),
      ),
    );
  }

  Widget _headCall({required String text}) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(text, style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xFF1F2937)),),
        ),
      ),
    );
  }
}
