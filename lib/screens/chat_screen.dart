import 'package:cs_v3/components/rounded_button.dart';
import 'package:cs_v3/components/slider.dart';
import 'package:cs_v3/screens/onegroup.dart';
import 'package:flutter/material.dart';
import 'package:cs_v3/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:cs_v3/data/group.dart';
import 'package:cs_v3/data/group_dao.dart';
import 'package:cs_v3/data/user.dart';
import 'package:cs_v3/data/user_dao.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

// import 'package:contacts_app/contactsPage.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'dart:typed_data';
import 'package:cs_v3/screens/group.dart';



final databaseReference = FirebaseDatabase.instance.reference();
final _auth = FirebaseAuth.instance;
late FirebaseUser loggedInUser;
final groupDao = GroupDao();
final userDao =UserDao();
final amountUser=500;
int yes=0;
bool OpenOrClosed=true;
int _selectedIndex=0;


String myname="";
String myphone="";


// class SeeContactsButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return RaisedButton(
//       onPressed: () async {
//         final PermissionStatus permissionStatus = await _getPermission();
//         if (permissionStatus == PermissionStatus.granted) {
//           //We can now access our contacts here
//         }
//       },
//       child: Container(child: Text('See Contacts')),
//     );
//   }

  //Check contacts permission
  // Future<PermissionStatus> _getPermission() async {
  //   final PermissionStatus permission = await Permission.contacts.status;
  //   if (permission != PermissionStatus.granted &&
  //       permission != PermissionStatus.denied) {
  //     final Map<Permission, PermissionStatus> permissionStatus =
  //         await [Permission.contacts].request();
  //     return permissionStatus[Permission.contacts] ??
  //         PermissionStatus.undetermined;
  //   } else {
  //     return permission;
  //   }
  // }}
// await PermissionGroup.camera.request()
//     try {
//       var x = await ContactsService.getContacts();
//       print(x);
//     } catch (e) {
//       print(e);
//     }
// if(){

// }
// List<Contact> contacts = await FlutterContacts.getContacts();
//////////////////////////

class ChatScreen extends StatefulWidget{
  static const String id = 'chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}



class _ChatScreenState extends State<ChatScreen> {
  List<Contact>? contactsall;
  List<Contact>? contacts;
  bool showSpinner = false;
  // final _auth = FirebaseAuth.instance;
  void initState() {
    super.initState();
    getCurrentUser();
    getContact();
  }
  void getCurrentUser() async {
    // try {
    //   final user = await _auth.currentUser();
    //   if (user != null) {
    //     loggedInUser = user;
    //   }
    // } catch (e) {
    //   print(e);
    // }
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
  void createRecord(){
    
    
  }
  void getContact() async {
    // if (await FlutterContacts.requestPermission()) {
    //   var tmpcontacts = await FlutterContacts.getContacts(
    //       withProperties: true, withPhoto: true).then((value){
    //         int nums=value.length;
    //         for(int i=0;i<nums;i++){
    //           print("doing");
    //           String phnum=value[i].phones.first.number;
    //           // var snapshot = FirebaseDatabase.instance.reference().child('users').orderByChild("Phnum").equalTo("$phnum");
    //           // if(snapshot.length){
    //           //   contacts!.add(value[i]);
    //           // }
    //           FirebaseDatabase.instance.reference().child('users').orderByChild("Phnum").equalTo("$phnum").once().then(
    //             (DataSnapshot data){
    //               if(data!=null && data.value!=null){
    //                 contacts!.add(value[i]);
    //               }
    //             }
    //           );

    //         }
    //       });
    //   // contacts=await FlutterContacts.getContacts(withProperties: true, withPhoto: true);
    //   print(contacts);
    //   setState(() {});
    // }
    if(await FlutterContacts.requestPermission()){
      contacts=await FlutterContacts.getContacts(withProperties: true, withPhoto: true);
      // int siz=contactsall!.length;
      // for(int i=0;i<siz;i++){
      //   String phnum=contactsall![i].phones.first.number;
      //   FirebaseDatabase.instance.reference().child('users').orderByChild("Phnum").equalTo("$phnum").onValue.map((event) => null);
      // }
      // getData() async {
      //   // final FirebaseUser user = await _firebaseAuth.currentUser();
      //   return await FirebaseDatabase.instance.reference().child('users');
      // }
      // getData().then((val){
      //     // print(val.Unamme);
      //     Map data = (val.data() as Map);
      //     data.forEach((key, value) {
      //       print('adding entry');
      //       entries.add(JournalEntryData(
      //         date: key,
      //         entryText: value['entryText'],
      //         feeling: value['feeling'],
      //       ));
      //     });
      // });
      // int siz=tmpcontacts.length;

    }


  }

  Widget GroupTransactionWidget(name,description,mem1,mem2,mem3,mem4,mem5,amt1,amt2,amt3,amt4,amt5,mypos){
    return Padding(padding: EdgeInsets.fromLTRB(0, 5,0, 5),
    child:
    InkWell(
    child:Container(
      height: 100,
      child:Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Icon(Icons.bookmark_rounded,
            color: Colors.deepPurple,),
            SizedBox(
              width: 5,
            ),
            Text("$name",
            style: TextStyle(
              fontSize: 20,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),),
          
          ],),
          Text("$description",
          style: TextStyle(
            fontSize: 10,
            color: Color.fromARGB(255, 209, 145, 244),
          ),)

        ],
    ),
      ),
    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color.fromARGB(32, 209, 179, 218),
        boxShadow: [
            BoxShadow(
                color: Color.fromARGB(33, 221, 157, 240),
                blurRadius: 1.0,
                spreadRadius: 1.0,
                offset: Offset(2.0, 0.0), // shadow direction: bottom right
            )
        ],
    ),
    
    ),
    onTap: () { 
        print("Click event on Container"); 
        Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyGroup(name,description,mem1,mem2,mem3,mem4,mem5,amt1,amt2,amt3,amt4,amt5,mypos),
                    ),
                  );
    },
    )
    );
  }
  Widget _OpenCards() {
  return 
    Expanded(
      child:new FirebaseAnimatedList(
      controller:ScrollController(),
      query: groupDao.getGroupQuery(),
      itemBuilder: (context, snapshot, animation, index) {
        final json = snapshot.value as Map<dynamic, dynamic>;
        var grp1 = GroupTransaction.fromJson(json);
        if(grp1.Mem1==myphone && grp1.IsClosed==false){
          return GroupTransactionWidget(grp1.Name,grp1.Description,grp1.Mem1,grp1.Mem2,grp1.Mem3,grp1.Mem4,grp1.Mem5,grp1.Amt1,grp1.Amt2,grp1.Amt3,grp1.Amt4,grp1.Amt5,1);
        }else if(grp1.Mem2==myphone && grp1.IsClosed==false){
          return GroupTransactionWidget(grp1.Name,grp1.Description,grp1.Mem1,grp1.Mem2,grp1.Mem3,grp1.Mem4,grp1.Mem5,grp1.Amt1,grp1.Amt2,grp1.Amt3,grp1.Amt4,grp1.Amt5,2);
        }else if(grp1.Mem3==myphone && grp1.IsClosed==false){
          return GroupTransactionWidget(grp1.Name,grp1.Description,grp1.Mem1,grp1.Mem2,grp1.Mem3,grp1.Mem4,grp1.Mem5,grp1.Amt1,grp1.Amt2,grp1.Amt3,grp1.Amt4,grp1.Amt5,3);
        }else if(grp1.Mem4==myphone && grp1.IsClosed==false){
          return GroupTransactionWidget(grp1.Name,grp1.Description,grp1.Mem1,grp1.Mem2,grp1.Mem3,grp1.Mem4,grp1.Mem5,grp1.Amt1,grp1.Amt2,grp1.Amt3,grp1.Amt4,grp1.Amt5,4);
        }else if(grp1.Mem5==myphone && grp1.IsClosed==false){
          return GroupTransactionWidget(grp1.Name,grp1.Description,grp1.Mem1,grp1.Mem2,grp1.Mem3,grp1.Mem4,grp1.Mem5,grp1.Amt1,grp1.Amt2,grp1.Amt3,grp1.Amt4,grp1.Amt5,5);
        }else{
          return Container();
        }
        
      },
    ),);
}
  
  Widget _ClosedCards(){
   return Expanded(
      child:new FirebaseAnimatedList(
      controller:ScrollController(),
      query: groupDao.getGroupQuery(),
      itemBuilder: (context, snapshot, animation, index) {
        final json = snapshot.value as Map<dynamic, dynamic>;
        var grp1 = GroupTransaction.fromJson(json);
        if(grp1.Mem1==myphone && grp1.IsClosed==true){
          return GroupTransactionWidget(grp1.Name,grp1.Description,grp1.Mem1,grp1.Mem2,grp1.Mem3,grp1.Mem4,grp1.Mem5,grp1.Amt1,grp1.Amt2,grp1.Amt3,grp1.Amt4,grp1.Amt5,1);
        }else if(grp1.Mem2==myphone && grp1.IsClosed==true){
          return GroupTransactionWidget(grp1.Name,grp1.Description,grp1.Mem1,grp1.Mem2,grp1.Mem3,grp1.Mem4,grp1.Mem5,grp1.Amt1,grp1.Amt2,grp1.Amt3,grp1.Amt4,grp1.Amt5,2);
        }else if(grp1.Mem3==myphone && grp1.IsClosed==true){
          return GroupTransactionWidget(grp1.Name,grp1.Description,grp1.Mem1,grp1.Mem2,grp1.Mem3,grp1.Mem4,grp1.Mem5,grp1.Amt1,grp1.Amt2,grp1.Amt3,grp1.Amt4,grp1.Amt5,3);
        }else if(grp1.Mem4==myphone && grp1.IsClosed==true){
          return GroupTransactionWidget(grp1.Name,grp1.Description,grp1.Mem1,grp1.Mem2,grp1.Mem3,grp1.Mem4,grp1.Mem5,grp1.Amt1,grp1.Amt2,grp1.Amt3,grp1.Amt4,grp1.Amt5,4);
        }else if(grp1.Mem5==myphone && grp1.IsClosed==true){
          return GroupTransactionWidget(grp1.Name,grp1.Description,grp1.Mem1,grp1.Mem2,grp1.Mem3,grp1.Mem4,grp1.Mem5,grp1.Amt1,grp1.Amt2,grp1.Amt3,grp1.Amt4,grp1.Amt5,5);
        }else{
          return Container();
        }
        
      },
    ),);
  }
  
  Widget Profileme(){

   return Expanded(
      child:new FirebaseAnimatedList(
      // controller: ScrollController(),
      query: userDao.getUserQuery().orderByChild("Uemail").equalTo("${loggedInUser.email}"),
      itemBuilder: (context, snapshot, animation, index) {
        final json = snapshot.value as Map<dynamic, dynamic>;
        var usr1 = UserProfile.fromJson(json);
        myname=usr1.Uname;
        myphone=usr1.Phnum;
        // setState(() {
          
        // });
        return Padding(padding: EdgeInsets.fromLTRB(5,5,5,5),
        child:Column(
          children: <Widget>[
            Text("${usr1.Uname}"),
            Text("${usr1.Phnum}"),
            Text("${usr1.Uemail}"),
          ],
        ));
        },
    ),);;
  }
  
  Widget _Contactme(){
    
    // return (contacts) == null
    //         ? Center(child: CircularProgressIndicator())
    //         : ListView.builder(
    //             itemCount: contacts!.length,
    //             itemBuilder: (BuildContext context, int index) {
    //               // var exits = FirebaseDatabase.instance.reference().child("users").orderByChild("Phnum").equalTo("${contacts![index].phones}").get();




    //               Uint8List? image = contacts![index].photo;
    //               String num = (contacts![index].phones.isNotEmpty) ? (contacts![index].phones.first.number) : "--";
    //               return ListTile(
    //                   leading: (contacts![index].photo == null)
    //                       ? const CircleAvatar(child: Icon(Icons.person))
    //                       : CircleAvatar(backgroundImage: MemoryImage(image!)),
    //                   title: Text(
    //                       "${contacts![index].name.first} ${contacts![index].name.last}"),
    //                   subtitle: Text(num),
    //                   onTap: () {
                        
    //                   });
    //             },
    //           );
  return Expanded(
      child:new FirebaseAnimatedList(
      // controller: ScrollController(),
      query: FirebaseDatabase.instance.reference().child("users"),
      itemBuilder: (context, snapshot, animation, index) {
        final json = snapshot.value as Map<dynamic, dynamic>;
        var usr1 = UserProfile.fromJson(json);

        // int siz=(contacts==null)?0:contacts!.length;
        
        // for(int i=0;i<siz;i++){
        //   // print(contacts![i].phones.first.number );
        //   // print(usr1.Phnum.toString());
        //   // print("done");
        //   // yes=0;
        //   if(contacts![i].phones.first.number.toString().compareTo(usr1.Phnum.toString()) == 0){
        //     print("matched me unmber");
        //     // setState(() =>{yes=1} );
        //     yes=1;
        //     break;
        //   }
        // }
        // print("$yes  I am zero");
        // if(yes==0){
        //   return Padding(padding: EdgeInsets.fromLTRB(5,5,5,5),
        // child:Column(
        //   children: <Widget>[
        //     Text("joeee"),
        //     Text(""),
        //     Text(""),
        //   ],
        // ));
        // }else{
          return Padding(padding: EdgeInsets.fromLTRB(5,5,5,5),
        child:Column(
          children: <Widget>[
            // Text("${usr1.hashCode}"),
            Text("${usr1.Uname}"),
            Text("${usr1.Phnum}"),
            Text("${usr1.Uemail}"),
          ],
        ));
        // }


        
        },
    ),);;
  // return Container();
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);

                //Implement logout functionality
              }),
        ],
        title:( loggedInUser==null)?Text("User",
        style: TextStyle(
        fontSize: 20.0,
        ),):Text("${loggedInUser.email}",
        style: TextStyle(
            fontSize: 20.0,
        ),),
        backgroundColor: Color.fromARGB(255, 61, 24, 118),
      ),
      body:(_selectedIndex==0)?SafeArea(child: Column(
        children: <Widget>[
              Container(
                height:150,
                width: double.infinity, 
                color: Color.fromARGB(33, 221, 157, 240),
                child:Column(
                  children: <Widget>[
                    Padding(
                      padding:EdgeInsets.fromLTRB(0, 15, 0, 5),
                    child:Text("Amount total :  ${amountUser}",
                    textAlign: TextAlign.center,
                    style:TextStyle(fontSize:40.0))
                    ),
                    SizedBox(
                      height:20.0,
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center ,
                      children: <Widget>[
                      
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios,
                        color:OpenOrClosed? Color.fromARGB(166, 62, 24, 118):Color.fromARGB(110, 62, 24, 118),),
                        onPressed: () {
                          setState((){
                            OpenOrClosed=true;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios,
                        color: OpenOrClosed?Color.fromARGB(110, 62, 24, 118):Color.fromARGB(166, 62, 24, 118),),
                        onPressed: () {
                          setState((){
                            OpenOrClosed=false;
                          });
                        },
                      )
                    ],)
                  ],
                )
                
                
                )
              ,
              Container(
                child:OpenOrClosed?_OpenCards():_ClosedCards(),
                
              )   ,
              Container(
                child:FloatingActionButton(
                backgroundColor: Color.fromARGB(171, 97, 3, 107),
                onPressed: (){
                    //add card
                    Navigator.pushNamed(context, GroupScreen.id);
                    // createRecord();
              },
              child:Text("+")) 
              ) 
        ],
      ))
    :(_selectedIndex==1)?SafeArea(child:Column(children: <Widget>[Profileme()],))
    :SafeArea(child:Column(children: <Widget>[_Contactme()],)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Contacts',
          ),
        ],
        unselectedItemColor: Colors.grey,
        elevation: 10,
        selectedItemColor: Colors.deepPurpleAccent,
        currentIndex: _selectedIndex,
        onTap: (int index){
          _selectedIndex = index;
            setState(() {

            });
        },
      ),
      
    );
  }
}
