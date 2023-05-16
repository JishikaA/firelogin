import 'package:firebase_auth/firebase_auth.dart';
import 'package:firelogin/Home.dart';
import 'package:firelogin/firelogin.dart';
import 'package:flutter/material.dart';
class newpage extends StatefulWidget {
  const newpage({Key? key}) : super(key: key);

  @override
  State<newpage> createState() => _newpageState();
}

class _newpageState extends State<newpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
    return firelogin();
    }
          else{
          return Home();
          }
        },
      )
    );
  }
}
