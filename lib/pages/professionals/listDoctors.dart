import 'package:flutter/material.dart';
import 'package:hulubebete/util/first_aid.dart';

class ListDoctors extends StatefulWidget {
  const ListDoctors({super.key});

  @override
  State<ListDoctors> createState() => _ListDoctorsState();
}

class _ListDoctorsState extends State<ListDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Doctors'),
        centerTitle: true,
        backgroundColor: Colors.red[200],
      ),
      body:  Column(
      children: [
         
      ],
    ),
    );
  }
}