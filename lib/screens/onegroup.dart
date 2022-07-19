import 'package:flutter/material.dart';
import 'package:cs_v3/data/group.dart';
import 'package:cs_v3/data/group_dao.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:cs_v3/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cs_v3/components/rounded_button.dart';

final databaseReference = FirebaseDatabase.instance.reference();
// final _auth = FirebaseAuth.instance;
// late FirebaseUser loggedInUser;
final groupDao = GroupDao();
Widget tmp=Container();
int numofmem=0;

class MyGroup extends StatefulWidget {
  // final String hashme;
  final String name;
  final String description;
  final String mem1;
  final String mem2;
  final String mem3;
  final String mem4;
  final String mem5;
  final int amt1;
  final int amt2;
  final int amt3;
  final int amt4;
  final int amt5;
  final int mypos;
  const MyGroup(this.name,this.description,this.mem1,this.mem2,this.mem3,this.mem4,this.mem5,this.amt1,this.amt2,this.amt3,this.amt4,this.amt5,this.mypos);
  static const String id = 'my_groups';
  @override
  _MyGroupState createState() => _MyGroupState();
}

class _MyGroupState extends State<MyGroup> {

  @override
  void initState(){
    super.initState();
    numofmem=0;
    nums();
  }
  
  void nums(){
    if(widget.mem1!=""){
      numofmem++;
    }
    if(widget.mem2==""){
      numofmem++;
    }
    if(widget.mem3==""){
      numofmem++;
    }
    if(widget.mem4==""){
      numofmem++;
    }
    if(widget.mem5==""){
      numofmem++;
    }
  }
  Widget build(BuildContext context) {
    // return Container(child: AGroup());
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: null,
        title:Text("${widget.name}"),
      ),
      body:SafeArea(
        child:Column(
          children: <Widget>[
            // ignore: avoid_unnecessary_containers
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child:Text("${widget.description}")
              ),
            ),
            Text("Who paid what"),
            Container(
              child:(widget.mem1=="")?Container():Text("${widget.mem1} - ${widget.amt1}"),
            ),
            Container(
              child:(widget.mem2=="")?Container():Text("${widget.mem2} - ${widget.amt2}"),
            ),
            Container(
              child:(widget.mem3=="")?Container():Text("${widget.mem3} - ${widget.amt3}"),
            ),
            Container(
              child:(widget.mem4=="")?Container():Text("${widget.mem4} - ${widget.amt4}"),
            ),
            Container(
              child:(widget.mem5=="")?Container():Text("${widget.mem5} - ${widget.amt5}"),
            ),
            Text("What to pay"),
            Container(
              child:(widget.mem1=="" || widget.mypos==1)?Container():Text("${widget.mem1} - ${(widget.amt1)/numofmem}"),
            ),
            Container(
              child:(widget.mem2=="" || widget.mypos==2)?Container():Text("${widget.mem2} - ${(widget.amt2)/numofmem}"),
            ),
            Container(
              child:(widget.mem3=="" || widget.mypos==3)?Container():Text("${widget.mem3} - ${(widget.amt3)/numofmem}"),
            ),
            Container(
              child:(widget.mem4=="" || widget.mypos==4)?Container():Text("${widget.mem4} - ${(widget.amt4)/numofmem}"),
            ),
            Container(
              child:(widget.mem5=="" || widget.mypos==5)?Container():Text("${widget.mem5} - ${(widget.amt5)/numofmem}"),
            ),
          ],
        )
      ),
    );

  }
}