package com.example.flutter_bloc_tests


// import android.Manifest
// import android.content.pm.PackageManager
// import android.os.Build
// import android.os.Bundle
// import android.telephony.SmsManager
// import androidx.annotation.NonNull
// import androidx.core.app.ActivityCompat
// import androidx.core.content.ContextCompat
// import io.flutter.embedding.android.FlutterActivity
// import io.flutter.plugin.common.MethodCall
// import io.flutter.plugin.common.MethodChannel
// import io.flutter.plugins.GeneratedPluginRegistrant
// import io.flutter.embedding.engine.FlutterEngine


// class MainActivity: FlutterActivity() {
//     private val CHANNEL = "smsChannelKt"
//     private val PERMISSION_REQUEST_CODE = 123

//     override fun configureFlutterEngine(  @NonNull flutterEngine: FlutterEngine) {
//         super.configureFlutterEngine(flutterEngine)

//         MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { 
//             call, result ->
//             if (call.method == "sendSMSkt") {
//                 val phoneNumber = call.argument<String>("phoneNumber")
//                 val message = call.argument<String>("message")
//                 val simSlotIndex = call.argument<Int>("simSlotIndex")
//                 if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
//                     requestSmsPermission(phoneNumber, message, simSlotIndex)
//                 } else {
//                     sendSMS(phoneNumber, message, simSlotIndex)
//                     result.success("SMS sent successfully!")
//                 }
//             } else {
//                 result.notImplemented()
//             }
//         }
//     }



//     private fun requestSmsPermission(phoneNumber: String?, message: String?, simSlotIndex: Int?) {
//         if (ContextCompat.checkSelfPermission(this, Manifest.permission.SEND_SMS) != PackageManager.PERMISSION_GRANTED) {
//             ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.SEND_SMS), PERMISSION_REQUEST_CODE)
//         } else {
//             sendSMS(phoneNumber, message, simSlotIndex)
//         }
//     }

//     override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
//         if (requestCode == PERMISSION_REQUEST_CODE && grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
             
//             val phoneNumber = ""  
//             val message = ""  
//             val simSlotIndex = 0
//             sendSMS(phoneNumber, message, simSlotIndex)
//         }
//     }

//     private fun sendSMS(phoneNumber: String?, message: String?, simSlotIndex: Int?) {
//         try {
//             SmsManager.getSmsManagerForSubscriptionId(simSlotIndex!!)
//                 .sendTextMessage(phoneNumber, null, message, null, null)
//         } catch (e: Exception) {
//             e.printStackTrace()
//         }
//     }
// }

import android.content.Context 
import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import android.telephony.SubscriptionInfo
import android.telephony.SubscriptionManager
import android.telephony.SmsManager
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {

    companion object {
        const val CHANNEL = "kt.ch.sms"
        const val PERMISSION_REQUEST_CODE = 123
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "sendSms" -> {
                        val simSlot = call.argument<Int>("simSlot")
                        val phone = call.argument<String>("phone")
                        val smsContent = call.argument<String>("smsContent")
                        val context = applicationContext

                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                            requestSmsPermission(context, simSlot ?: 0, phone, smsContent)
                        } else {
                            sendSMS(context, simSlot ?: 0, phone, smsContent)
                            result.success("SMS sent successfully!")
                        }
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            }
    }

    private fun requestSmsPermission(context: android.content.Context, simSlot: Int, phone: String?, smsContent: String?) {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.SEND_SMS) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.SEND_SMS), PERMISSION_REQUEST_CODE)
        } else {
            sendSMS(context, simSlot, phone, smsContent)
        }
    }

    private fun sendSMS(context: android.content.Context, simSlot: Int, phone: String?, smsContent: String?) {
        val localSubscriptionManager = context.getSystemService(Context.TELEPHONY_SUBSCRIPTION_SERVICE) as SubscriptionManager

        if (localSubscriptionManager.activeSubscriptionInfoCount > 1) {
            val localList = localSubscriptionManager.activeSubscriptionInfoList
            val simInfo = localList[simSlot] as SubscriptionInfo
            SmsManager.getSmsManagerForSubscriptionId(simInfo.subscriptionId).sendTextMessage(phone, null, smsContent, null, null)
        } else {
            SmsManager.sendTextMessage(phone, null, smsContent, null, null)
        }
    }
}
