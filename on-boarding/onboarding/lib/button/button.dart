import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String name;
  final Color color;
  const Button(
    {Key? key,
    required this.name,
    required this.color,
    })
    :super(key: key);

  
  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(const Size(250, 50)) ,
        backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
      
      onPressed: null,
      child: Text(
        name, 
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}