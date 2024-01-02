import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class SendSmsTestPage extends StatefulWidget {
  const SendSmsTestPage({super.key});

  @override
  State<SendSmsTestPage> createState() => _SendSmsTestPageState();
}

class _SendSmsTestPageState extends State<SendSmsTestPage> {
  final Telephony telephony = Telephony.instance;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneContorller = TextEditingController();
  final TextEditingController _msgContorller = TextEditingController();
  // final TextEditingController _qtySms = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _sendSms();
            },
            child: Icon(Icons.send),
          ),
          FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return FutureBuilder<List<SmsMessage>>(
                        future: _getSms(),
                        builder: (context, snap) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: snap.hasData
                                ? ListView.builder(
                                    itemBuilder: (context, index) {
                                      print(snap.data);
                                      return ListTile(
                                        title: Text(
                                            snap.data![index].date!.toString()),
                                      );
                                    },
                                    itemCount: snap.data!.length,
                                  )
                                : Center(
                                    child: CircularProgressIndicator(),
                                  ),
                          );
                        });
                  });
            },
            child: Icon(Icons.inbox),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Send sms service'),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(children: [
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: 'Phone number'),
                    controller: _phoneContorller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Type phone number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Message'),
                    controller: _msgContorller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Type message';
                      }
                      return null;
                    },
                  ),
                  // TextFormField(
                  //   keyboardType: TextInputType.number,
                  //   decoration: InputDecoration(labelText: 'Qty'),
                  //   controller: _qtySms,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Type qty';
                  //     }
                  //     return null;
                  //   },
                  // ),
                ]),
              ))),
    );
  }

  _sendSms() async {
    telephony.sendSms(to: _phoneContorller.text, message: _msgContorller.text);
  }

  Future<List<SmsMessage>> _getSms() async {
    List<SmsMessage> messages = await telephony.getInboxSms(
        columns: [SmsColumn.ADDRESS, SmsColumn.BODY],
        filter:
            SmsFilter.where(SmsColumn.ADDRESS).equals(_phoneContorller.text));
    print(_phoneContorller.text);
    print(messages);
    return messages;
    // final dynamic messages = await telephony.getConversations(
    //     filter:
    //         ConversationFilter.where(ConversationColumn.SNIPPET).equals(_phoneContorller.text));
    // return messages;
  }
}
