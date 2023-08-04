import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String label;
  final Icon? customIcon;
  final int lines;
  const CustomTextInput({
    Key?key ,
    required this.label , 
    this.customIcon ,
    required this.lines,
    })
    :super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'popins',
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
              
            ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Stack(
              children: [TextField(
                maxLines: lines,
                decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
                
                
                ),
                ),
                if(customIcon != null)
                Positioned(
                  right: 10,

                  bottom: 10,
                  child: Icon(
                    customIcon?.icon,
                    color: Colors.red,
                    size: 35,
                  ) ,
                ),
              
              ],
            ),
            ),
          
            
        ]
    
    
      ),
    );
  }
}