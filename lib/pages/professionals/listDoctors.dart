import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hulubebete/util/doctorE.dart';
import 'package:hulubebete/util/first_aid.dart';
import 'package:http/http.dart';

import '../../util/doctorutil.dart';

class ListDoctors extends StatefulWidget {
  const ListDoctors({super.key});

  @override
  State<ListDoctors> createState() => _ListDoctorsState();
}

class _ListDoctorsState extends State<ListDoctors> {

  List<dynamic> doctors = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  void fetchData() async {
    try {
      final url = "https://fproject1.onrender.com/getgagaris";

      final data = await get(Uri.parse(url));

      setState(() {
        doctors = jsonDecode(data.body);
      });
      //List<GagariUtil> x = gagaris.map((g) => gu.add(GagariUtil(g.name, g.rate))).toList();

      doctorUtilList = doctors.map((jsonObject) {
        String name = jsonObject['name'];
        double rate = jsonObject['rate'].toDouble();
        return DoctorUtil(name, rate);
      }).toList();
       print(doctorUtilList);
    } catch (e) {
      print(e);
    }
  }
  List<DoctorUtil> doctorUtilList = [];
  DoctorUtil g = new DoctorUtil("name", 20.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Doctors'),
        centerTitle: true,
        backgroundColor: Colors.red[200],
      ),
      body: ListView.builder(
        itemCount: doctorUtilList.length
        ,itemBuilder: ((context, index) {
        return doctorUtilList.isEmpty
                        ? Text("")
                        : DoctorE(doctors: doctorUtilList[index]);
      }))
    );
  }
}