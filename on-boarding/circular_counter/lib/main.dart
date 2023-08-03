import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body:Counter(),
        ),
      );
      
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;
  final boundary = 11;

  void _increment() {
    setState(() {
      _count = _count + 1;
      _count = _count % boundary;
    });
  }
void _decrement() {
    setState(() {
      _count = _count - 1;
      _count = _count % boundary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text(
              
              '$_count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _increment,
                child: const Text(
                  "Increment" ,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 19,
                  )
                ),
              ),
              // const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _decrement,
                child: const Text(
                  "Decrement",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 19,
                  )
                ),
              ),
            ],
          )
         
        
      ],
    );
  }
}

