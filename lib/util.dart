import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final color;
  final String path;
  const MyButton(
      {required this.name, required this.color, required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: 70,
          height: 70,
          child: Image(image: AssetImage(path), fit: BoxFit.cover),
        ),
        Text(name),
      ],
    );
  }
}
