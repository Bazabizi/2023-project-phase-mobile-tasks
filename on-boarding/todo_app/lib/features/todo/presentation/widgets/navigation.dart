import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  final String title;
  const Navigation({Key?key , required this.title}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.deepOrange,
          iconSize : 38, 
          onPressed: () { Navigator.pop(context); },
        ),
        
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            fontFamily: 'inter',
          ),
        ),
        
        const Icon(
          Icons.more_vert,
          color: Colors.black,
          size: 38,
        ),
      ],
    );
  }
}