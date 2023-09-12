import 'package:flutter/material.dart';

class FirstUtil extends StatelessWidget {
  final String name;
  final color;
  final String path;
  const FirstUtil(
      {required this.name, required this.color, required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 10),
      child: SizedBox(
        height: 110,
        child: Card(
          
          elevation: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               Padding(
                 padding: const EdgeInsets.all(12.0),
                 child: Image(image: AssetImage(path), fit: BoxFit.cover),
               ),
               Text(name)
            ],
          ),
        ),
      ),
    );
  }
}
