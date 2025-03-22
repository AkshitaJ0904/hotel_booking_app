import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';
import 'confirmation_page.dart';

class PaymentPage extends StatelessWidget {
  final HotelListData roomData;

  const PaymentPage({Key? key, required this.roomData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment', style: TextStyles(context).getTitleStyle()),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Room: ${roomData.titleTxt}', style: TextStyles(context).getBoldStyle()),
            Text('Total: \$${roomData.perNight}', style: TextStyles(context).getRegularStyle()),
            SizedBox(height: 20),
            TextField(decoration: InputDecoration(labelText: 'Card Number')),
            TextField(decoration: InputDecoration(labelText: 'Expiry Date')),
            TextField(decoration: InputDecoration(labelText: 'CVV')),
            TextField(decoration: InputDecoration(labelText: 'Name on Card')),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Confirm Booking', style: TextStyles(context).getRegularStyle()),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfirmationPage(roomData: roomData)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}