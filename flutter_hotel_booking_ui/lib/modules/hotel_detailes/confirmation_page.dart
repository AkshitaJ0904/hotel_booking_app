import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';

class ConfirmationPage extends StatelessWidget {
  final HotelListData roomData;

  const ConfirmationPage({Key? key, required this.roomData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmed', style: TextStyles(context).getTitleStyle()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your booking has been confirmed!', style: TextStyles(context).getBoldStyle()),
            SizedBox(height: 20),
            Text('Room: ${roomData.titleTxt}', style: TextStyles(context).getRegularStyle()),
            Text('Total: \$${roomData.perNight}', style: TextStyles(context).getRegularStyle()),
            Text('Booking ID: #${DateTime.now().millisecondsSinceEpoch}', style: TextStyles(context).getDescriptionStyle()),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Return to Home', style: TextStyles(context).getRegularStyle()),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}