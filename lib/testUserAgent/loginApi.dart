import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:http/http.dart' as http;
import 'package:unique_identifier/unique_identifier.dart';

loginTest() async {
   String identifier = '';
  if (Platform.isAndroid) {
      identifier = await UniqueIdentifier.serial ?? 'null';
  } else if (Platform.isIOS) {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final data = await deviceInfoPlugin.iosInfo;
    identifier = data.identifierForVendor;
  }

  final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/auth/login'),
      headers: {'Content-Type': 'application/json', 'User-Agent': 'IMEI $identifier '},
      body: json.encode({"email": "testMail@1.tm", "password": "123456"}));

  print(response.statusCode);
  print(response.body);
}
