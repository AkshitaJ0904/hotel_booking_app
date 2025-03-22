import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';
import 'payment_page.dart';

class BookingDetailsPage extends StatelessWidget {
  final HotelListData roomData;

  const BookingDetailsPage({Key? key, required this.roomData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details', style: TextStyles(context).getTitleStyle()),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Room: ${roomData.titleTxt}', style: TextStyles(context).getBoldStyle()),
            Text('Price: \$${roomData.perNight} per night', style: TextStyles(context).getRegularStyle()),
            SizedBox(height: 20),
            TextField(decoration: InputDecoration(labelText: 'Check-in Date')),
            TextField(decoration: InputDecoration(labelText: 'Check-out Date')),
            TextField(decoration: InputDecoration(labelText: 'Number of Guests')),
            TextField(decoration: InputDecoration(labelText: 'Special Requests')),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Proceed to Payment', style: TextStyles(context).getRegularStyle()),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage(roomData: roomData)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}