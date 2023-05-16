
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class firelogin extends StatefulWidget {
  const firelogin({Key? key}) : super(key: key);

  @override
  State<firelogin> createState() => _fireloginState();
}

class _fireloginState extends State<firelogin> {
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  Future LOGIN() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password:passwordController.text.trim(),
    );
  }
 /* Future<String?>LOGIN
      ({
    required String email,
    required String password,
  })
  async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'no user found for that email';
      }
      else if (e.code == 'wrong-password') {
        return 'wrong password provided for that user';
      }
      else {
        return e.message;
      }
    }
    catch (e) {
      return e.toString();
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller:emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.purple.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.purple.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'password',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                style:TextButton.styleFrom(backgroundColor: Colors.black,fixedSize: Size(120, 35)),
                onPressed: (){LOGIN();}, child: Text('LOGIN',
                style:TextStyle(color:Colors.white )))
          ],
        ),
      ),
    );
  }
}
