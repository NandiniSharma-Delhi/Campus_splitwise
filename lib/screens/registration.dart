import 'package:cs_v3/constants.dart';
import 'package:cs_v3/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:cs_v3/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cs_v3/data/user.dart';
import 'package:cs_v3/data/user_dao.dart';

final userDao = UserDao();

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email="";
  String password="";
  String Uname="";
  String Phnum="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  Uname = value;
                },
                style: TextStyle(
                  color: Color.fromARGB(255, 156, 158, 159),
                ),
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your name'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  Phnum = value;
                },
                style: TextStyle(
                  color: Color.fromARGB(255, 156, 158, 159),
                ),
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your phone no.'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                style: TextStyle(
                  color: Color.fromARGB(255, 156, 158, 159),
                ),
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                style: TextStyle(
                  color: Color.fromARGB(255, 156, 158, 159),
                ),
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                onPressed1: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      final usr = UserProfile(Uname, Phnum, email);
                      userDao.saveUser(usr);
                      // setState(() {});
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    
                  } catch (e) {
                    print(e);
                  }
                  setState(() {
                      showSpinner = false;
                  });
                },
                colour: Colors.deepPurpleAccent,
                title: 'Register',
              )
            ],
          ),
        ),
      ),
    );
  }
}
