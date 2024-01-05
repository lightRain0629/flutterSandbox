import 'package:flutter/services.dart';

class SmsSenderKt {
  static const platform =  MethodChannel("kt.ch.sms");

  static Future<void> sendSMS( 
      int simSlot, String phone, String smsContent) async {
    try {
      await platform.invokeMethod("sendSms", {
        'simSlot': simSlot,
        'phone': phone,
        'smsContent': smsContent,
      });
    } on PlatformException catch (e) {
      print("Failed to send SMS: '${e.message}'.");
    }
  }
}
