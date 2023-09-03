import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final color;
  final String path;
  const MyWidget({required this.path, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.only(right: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Image(
        image: AssetImage(path),
        fit: BoxFit.cover,
      ),
    );
  }
}
