import 'package:flutter/material.dart';

class Designs extends StatelessWidget {
  final color;
  final String path;
  const Designs(
      {required this.color, required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: 100,
          height: 100,
          child: Image(image: AssetImage(path), fit: BoxFit.cover),
        ),
        
      ],
    );
  }
}
