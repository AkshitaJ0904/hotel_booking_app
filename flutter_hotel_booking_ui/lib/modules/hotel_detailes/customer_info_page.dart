import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';
import 'BookingDetailsPage.dart';

class CustomerInfoPage extends StatelessWidget {
  final HotelListData roomData;

  const CustomerInfoPage({Key? key, required this.roomData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Information', style: TextStyles(context).getTitleStyle()),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Booking for: ${roomData.titleTxt}', style: TextStyles(context).getBoldStyle()),
            SizedBox(height: 20),
            TextField(decoration: InputDecoration(labelText: 'Name')),
            TextField(decoration: InputDecoration(labelText: 'Address')),
            TextField(decoration: InputDecoration(labelText: 'Phone Number')),
            TextField(decoration: InputDecoration(labelText: 'Email')),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Next', style: TextStyles(context).getRegularStyle()),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingDetailsPage(roomData: roomData)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}