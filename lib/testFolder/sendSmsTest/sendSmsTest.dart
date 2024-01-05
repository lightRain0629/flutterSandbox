import 'package:flutter/material.dart';

import '../../sendSmsService/sendSmsService.dart';
import '../../sendSmsService/smsSenderServiceJava/smsSenderServiceJava.dart';

// todo u can send sms that comes from server in payload... there will be number, message, locale...
//create some service that will send sms directly to customer, dont forget to check sms quote that depends on lang,
//and 1 sim can send 100 per hour u must handle by switching to other sim card

class SendSMSTest extends StatefulWidget {
  const SendSMSTest({
    super.key,
  });

  @override
  State<SendSMSTest> createState() => _SendSMSTestState();
}

class _SendSMSTestState extends State<SendSMSTest> {
  late TextEditingController msgEditingController;
  late TextEditingController phoneNumberEditingController;
  late TextEditingController simSlotIndexController;

  @override
  void initState() {
    // TODO: implement initState
    msgEditingController = TextEditingController();
    phoneNumberEditingController = TextEditingController();
    simSlotIndexController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (msgEditingController.text.isNotEmpty &&
              phoneNumberEditingController.text.isNotEmpty) {
            _sendSms();
          } else {
            print('not sent');
          }
        },
        child: const Icon(Icons.send),
      ),
      appBar: AppBar(
        title: const Text('Sending sms with selectable sim'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneNumberEditingController,
                    decoration:
                        const InputDecoration(labelText: 'Phone number'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: msgEditingController,
                    decoration: const InputDecoration(labelText: 'Message'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: simSlotIndexController,
                    decoration: const InputDecoration(labelText: 'Slot'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _sendSms() async {
    print('slot ' + simSlotIndexController.text);
    print('phoneNumber to' + phoneNumberEditingController.text);
    print('msg ' + msgEditingController.text);
    await SmsSenderKt.sendSMS(
 
        int.parse(simSlotIndexController.text),
        phoneNumberEditingController.text,
        msgEditingController.text,
        );
  }

  // _sendSms() async {
  //   print('slot ' + simSlotIndexController.text);
  //   print('phoneNumber ' + phoneNumberEditingController.text);
  //   print('msg ' + msgEditingController.text);
  //   SmsSenderServiceKt.sendSMS(
  //       msgEditingController.text,
  //       int.parse(simSlotIndexController.text),
  //       phoneNumberEditingController.text);
  // }
}
