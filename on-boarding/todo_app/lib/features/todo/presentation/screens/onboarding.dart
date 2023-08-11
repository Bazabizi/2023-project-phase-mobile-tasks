import 'package:flutter/material.dart';
import '../../../../routes.dart';
import '../widgets/button_onboarding.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key?key}):super(key: key);
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 110, 101, 1),
      body: Stack(
        children:[
          Center(
            child: Image(
              image: AssetImage('assets/images/onboarding.png'),
            ),
          ),
          
          Positioned( 
            bottom: 50,
            left:0,
            right:0,
            child: Center(
            child: Button(
              name: 'Get Started',
              color: Colors.blueAccent,
              onpressed: () {
                Navigator.pushNamed(context, Routes.todoList);
              },
            ),
            ), 
              
          ),
        ]
      ) 
        );
    
  }
}