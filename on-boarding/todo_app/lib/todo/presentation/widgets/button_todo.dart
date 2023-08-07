import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const Button({
    Key?key,
    required this.label,
    required this.onPressed,
    }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style:ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(const Size(200, 40)) ,
          backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),       
        ),
        onPressed: onPressed,
        child: Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
        ),
      ),
    );
  }
}