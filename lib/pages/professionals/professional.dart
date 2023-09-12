import 'package:flutter/material.dart';
import 'package:hulubebete/pages/professionals/listDoctors.dart';
import 'package:hulubebete/util/first_aid.dart';

class Professionals extends StatefulWidget {
  const Professionals({super.key});

  @override
  State<Professionals> createState() => _ProfessionalsState();
}

class _ProfessionalsState extends State<Professionals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proffesionals'),
        centerTitle: true,
        backgroundColor: Colors.red[200],
      ),
      body:  Column(
      children: [
        GestureDetector(onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ListDoctors()));
                     },  child: FirstUtil(name: "Doctors", color: Colors.red, path: "images/professionals/d2.png")),
         FirstUtil(name: "Nurses", color: Colors.red, path: "images/professionals/n1.png"),
          FirstUtil(name: "Ansthesia", color: Colors.red, path: "images/professionals/a1.jpg")
      ],
    ),
    );
  }
}