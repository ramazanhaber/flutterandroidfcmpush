import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterandroidfcmpush/sabitler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Future<void> initState() async {
    // TODO: implement initState
    super.initState();


    FirebaseMessaging.instance.getToken().then((value) {
      Sabitler.token=value!;
      setState(() {

      });
    });



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("FCM İOS İÇİN"),),
        body: Container(child: Text(Sabitler.token),));
  }
}
