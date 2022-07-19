import 'package:flutter/material.dart';

class Slidersmall extends StatelessWidget {
  // RoundedButton({super.key});
  final Color colour;
  final String title;
  final Function() onPressed1;
  Slidersmall({required this.colour,required this.title, required this.onPressed1});
  
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        elevation: 2.0,
        color: colour,
        borderRadius: BorderRadius.circular(5.0),
        child: MaterialButton(
          onPressed: onPressed1,
          minWidth: 5.0,
          height: 5.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
