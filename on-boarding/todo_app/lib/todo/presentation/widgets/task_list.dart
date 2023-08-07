import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final String taskName;
  final String date;
  final Color color;
  const TaskList({
    Key?key ,
    required this.taskName,
    required this.date,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [Container(
        height: 70,
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      ),
      Positioned(
        left: 25,
        top: 15,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Color.fromARGB(66, 159, 153, 153),
                shape: BoxShape.circle,
                
              ),
              child: Center(
                child: Text(
                  taskName[0],
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              width: 100,
              child:  Text(
                taskName,
                maxLines: 3,

                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 30,
              
            ),
            Container(
              child: Text(
                date,
                style: const TextStyle(
                  fontSize: 14,
                ),
              )
            ),
            SizedBox(
              width: 10,
              height: 40,
              child : VerticalDivider(
                color: color,
                thickness: 3,

              ),
            ),
            
            
            
          ],
        ),
      )

      ],
    );
  }
}