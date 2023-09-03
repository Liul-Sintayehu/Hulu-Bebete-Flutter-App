import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final label;
  final txtcont;
  const MyTextField({required this.label, required this.txtcont, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: SizedBox(
        height: 40,
        child: TextField(
          controller: txtcont,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0),
              fillColor: Colors.grey[300],
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50)),
              label:  Text(
                label,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}
