import 'package:flutter/material.dart';
import 'package:cs_v3/data/group.dart';
import 'package:cs_v3/data/group_dao.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:cs_v3/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cs_v3/components/rounded_button.dart';


final databaseReference = FirebaseDatabase.instance.reference();
final _auth = FirebaseAuth.instance;
late FirebaseUser loggedInUser;
final groupDao = GroupDao();


class GroupScreen extends StatefulWidget {
  static const String id = 'group';
  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  bool showSpinner = false;
  String Name="";
  String Description="";
  String Mem1="";
  int Amt1=0;
  String Mem2="";
  int Amt2=0;
  String Mem3="";
  int Amt3=0;
  String Mem4="";
  int Amt4=0;
  String Mem5="";
  int Amt5=0;
  

  void initState() {
    super.initState();
    getCurrentUser();
    // getContact();
  }
  // void getCurrentUser()async{
  //   // try {
  //   //   final user = await _auth.currentUser();
  //   //   if (user != null) {
  //   //     loggedInUser = user;
  //   //   }
  //   // } catch (e) {
  //   //   print(e);
  //   // }
  // }
  void getCurrentUser()async{
    setState(() {
                    showSpinner = true;
                  });
    final user=await _auth.currentUser().then((value){
      loggedInUser = value;
      setState(() {
                    showSpinner = false;
                  });

    });
    
  }
  @override
  void createGroup(name,description,mem1,amt1,mem2,amt2,mem3,amt3,mem4,amt4,mem5,amt5){
    final grp = GroupTransaction(DateTime.now(), name, description, false, mem1, amt1,mem2, amt2,mem3,amt3, mem4,amt4, mem5,amt5);
    groupDao.saveGroup(grp);
    setState(() {});
    print("craete record");
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  Name = value;
                },
                style: TextStyle(
                  color: Color.fromARGB(255, 156, 158, 159),
                ),
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Name of Group'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  Description = value;
                },
                style: TextStyle(
                  color: Color.fromARGB(255, 156, 158, 159),
                ),
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Description'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  Mem1 = value;
                },
                style: TextStyle(
                  color: Color.fromARGB(255, 156, 158, 159),
                ),
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Person 1 phone'),
              ),
              SizedBox(
                height: 8.0,
              ),
              // TextField(
              //   keyboardType: TextInputType.number,
              //   textAlign: TextAlign.center,
              //   onChanged: (value) {
              //     Amt1 = int.parse(value);
              //   },
              //   style: TextStyle(
              //     color: Color.fromARGB(255, 156, 158, 159),
              //   ),
              //   decoration:
              //       kTextFieldDecoration.copyWith(hintText: 'Person 1 amount'),
              // ),
              // SizedBox(
              //   height: 8.0,
              // ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  Mem2 = value;
                },
                style: TextStyle(
                  color: Color.fromARGB(255, 156, 158, 159),
                ),
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Person 2 phone'),
              ),
              SizedBox(
                height: 8.0,
              ),
              // TextField(
              //   keyboardType: TextInputType.number,
              //   textAlign: TextAlign.center,
              //   onChanged: (value) {
              //     Amt2 = int.parse(value);
              //   },
              //   style: TextStyle(
              //     color: Color.fromARGB(255, 156, 158, 159),
              //   ),
              //   decoration:
              //       kTextFieldDecoration.copyWith(hintText: 'Description'),
              // ),
              // SizedBox(
              //   height: 8.0,
              // ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  Mem3 = value;
                },
                style: TextStyle(
                  color: Color.fromARGB(255, 156, 158, 159),
                ),
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Person 3 phone'),
              ),
              SizedBox(
                height: 8.0,
              ),
              // TextField(
              //   keyboardType: TextInputType.number,
              //   textAlign: TextAlign.center,
              //   onChanged: (value) {
              //     Amt3 = int.parse(value);
              //   },
              //   style: TextStyle(
              //     color: Color.fromARGB(255, 156, 158, 159),
              //   ),
              //   decoration:
              //       kTextFieldDecoration.copyWith(hintText: 'Description'),
              // ),
              // SizedBox(
              //   height: 8.0,
              // ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  Mem4 = value;
                },
                style: TextStyle(
                  color: Color.fromARGB(255, 156, 158, 159),
                ),
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Person 4 phone'),
              ),
              SizedBox(
                height: 8.0,
              ),
              // TextField(
              //   keyboardType: TextInputType.number,
              //   textAlign: TextAlign.center,
              //   onChanged: (value) {
              //     Amt4 = int.parse(value);
              //   },
              //   style: TextStyle(
              //     color: Color.fromARGB(255, 156, 158, 159),
              //   ),
              //   decoration:
              //       kTextFieldDecoration.copyWith(hintText: 'Description'),
              // ),
              // SizedBox(
              //   height: 8.0,
              // ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  Mem5 = value;
                },
                style: TextStyle(
                  color: Color.fromARGB(255, 156, 158, 159),
                ),
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Person 5 phone'),
              ),
              SizedBox(
                height: 8.0,
              ),
              // TextField(
              //   keyboardType: TextInputType.number,
              //   textAlign: TextAlign.center,
              //   onChanged: (value) {
              //     Amt5 = int.parse(value);
              //   },
              //   style: TextStyle(
              //     color: Color.fromARGB(255, 156, 158, 159),
              //   ),
              //   decoration:
              //       kTextFieldDecoration.copyWith(hintText: 'Description'),
              // ),
              // SizedBox(
              //   height: 8.0,
              // ),
              RoundedButton(
                onPressed1: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    createGroup(Name,Description,Mem1,Amt1,Mem2,Amt2,Mem3,Amt3,Mem4,Amt4,Mem5,Amt5);
                    Navigator.pop(context);
                  } catch (e) {
                    print(e);
                  }
                  
                  setState(() {
                      showSpinner = false;
                  });
                },
                colour: Colors.deepPurpleAccent,
                title: 'Save',
              )
            ],
          ),
        ),
      ),
    );
  }
}
