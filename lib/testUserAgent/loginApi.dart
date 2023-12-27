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

// TODO implement this functionality for sending device info into header to user-agent

// import 'package:device_info_plus/device_info_plus.dart';

// DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
// AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
// print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"

// IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
// print('Running on ${iosInfo.utsname.machine}');  // e.g. "iPod7,1"

// WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
// print('Running on ${webBrowserInfo.userAgent}');  // e.g. "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"