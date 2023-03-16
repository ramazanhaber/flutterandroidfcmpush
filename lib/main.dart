import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_fire_notifications/pushnotification.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  try{
    await Firebase.initializeApp();
  }catch(ex){
  }

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  PushFireNotifications(
      fcmTokenGet: (String token) {
        // Here we can get FCM token when app starts.
        print("TOKEN : "+token); // her uygulamaya bir anahtar verir. bu anahtar sadece uygulama silinirse değişir. değişebileceği için her loginde k.ad şifre girdiğinde user tablosundaki token alanını her giriş yaptıgında güncelle
      },
      onNotification: (String payload) {
        // This function trigger whenever notification occurs
        // get data in payload
        print("1 "+payload);
      },
      onTapNotification: (String payload) {
        // This function use for on tap notification when app
        // is running mode
        print("2 "+payload);
      },
      onTapAppTerminatedNotification: (String payload) {
        // This function use for on tap notification when
        // app is terminated mode
        print("3 "+payload);
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:  Scaffold(appBar: AppBar(title: Text("FCM 2"),),
        body: Container(child: Text("Sadece Android FCM PUSH"),),
        ),
      ),
    );
  }
}
