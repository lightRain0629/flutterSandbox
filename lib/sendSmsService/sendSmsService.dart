import 'package:flutter/services.dart';

class SmsSenderServiceKt {
  static const platform = MethodChannel('smsChannelKt');

  static Future<String> sendSMS(
      String message, int simSlotIndex, String phoneNumber) async {
    try {
      final String result = await platform.invokeMethod('sendSMSkt', {
        'message': message,
        'simSlotIndex': simSlotIndex,
        'phoneNumber': phoneNumber,
      });
      return result;
    } on PlatformException catch (e) {
      print(e.message);
      return "Failed to send SMS: '${e.message}'.";
    }
  }
}
