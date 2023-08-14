import 'package:flutter/material.dart';


class TaskElements extends StatelessWidget {
  final String title;
  final String subtitle;  
  const TaskElements({
    Key?key,
    required this.title,
    required this.subtitle,    
     })
    :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: 'inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(66, 209, 198, 198),
                  borderRadius: BorderRadius.circular(5),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.only(top:12.0,left:15,bottom:12.0,right:20.0),
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'inter',
                    ),
                    maxLines: 6,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}