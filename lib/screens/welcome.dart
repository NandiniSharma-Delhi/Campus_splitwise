import 'package:cs_v3/screens/login.dart';
import 'package:cs_v3/screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cs_v3/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  // WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}
// class _WelcomeScreenState extends State<WelcomeScreen>{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//             children: <Widget>[
//           RoundedButton(
//               title: 'Log In',
//               colour: Colors.deepPurpleAccent,
//               onPressed: (){
//                 // Navigator.pushNamed(context, LoginScreen.id);
//                 print("hi login");
//               },
//             ),
//             RoundedButton(
//               title: 'Registerme',
//               colour: Colors.deepPurple,
//               onPressed: (){
//                 print("done");
//                 Navigator.pushNamed(context, RegistrationScreen.id);
//               },
//             ),
//               ],
//       ),),
//     );
// }}
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
      upperBound: 1.0,
    );
    animation = ColorTween(begin: Colors.deepPurpleAccent, end: Colors.black)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                    width:30.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Campus Splitwise'],
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            // TextButton(onPressed: (){Navigator.pushNamed(context, LoginScreen.id);}, child: Text("Login")),
            // TextButton(onPressed: (){Navigator.pushNamed(context, RegistrationScreen.id);}, child: Text("register")),
            RoundedButton(
              title: 'Log In',
              colour: Colors.deepPurpleAccent,
              onPressed1: (){
                Navigator.pushNamed(context, LoginScreen.id);
                // print("hi login bye login");
              },
            ),
            RoundedButton(
              title: 'Registerme',
              colour: Colors.deepPurple,
              onPressed1: (){
                // print("done");
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
