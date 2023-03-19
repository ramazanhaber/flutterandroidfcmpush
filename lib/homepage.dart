import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterandroidfcmpush/sabitler.dart';

import 'LocalNotificationService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void fcmRun() {


    /*
    // uygulama kapalı iken çalışacak metot
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("1-> FirebaseMessaging.instance.getInitialMessage()");
      },
    );*/




    // 2. This method only call when App in forground it mean app must be opened
// uygulama açıkken tıklanınca çalışan metot
    FirebaseMessaging.onMessage.listen(
          (message) {
        print("2-> FirebaseMessaging.instance.getInitialMessage()");
        if(Platform.isAndroid){
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );


    // 3. This method only call when App in background and not terminated(not closed)
    // uygulama açık ama arka plandayken çalışan metot
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("3-> FirebaseMessaging.onMessageOpenedApp.listen");

      },
    );

    FirebaseMessaging.instance
        .subscribeToTopic("all")
        .then((value) => print("topic all olarak eklendi"));

    FirebaseMessaging.instance.getToken().then((value) {
      print('firebaseToken $value');
      Sabitler.token = value!;
    });

  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fcmRun();

    Future.delayed(Duration(seconds: 3)).then((value) {
      setState(() {

      });
    });


  /*
    FirebaseMessaging.instance.getToken().then((value) {
      Sabitler.token=value!;
      setState(() {

      });
    });*/

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("FCM İOS İÇİN"),),
        body: Container(child: Text(Sabitler.token),));
  }
}
