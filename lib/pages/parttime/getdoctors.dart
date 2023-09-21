import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hulubebete/pages/professionals/listDoctors.dart';
import 'package:hulubebete/util/first_aid.dart';

class Professional extends StatefulWidget {
  const Professional({super.key});

  @override
  State<Professional> createState() => _ProfessionalState();
}

class _ProfessionalState extends State<Professional> {
  
  List<dynamic> profs = [];
  void getData() async {
    try {
      final url = "https://fproject1.onrender.com/getfirstaiders";

      final data = await get(Uri.parse(url));

      setState(() {
        profs = jsonDecode(data.body);
      });
      //List<GagariUtil> x = gagaris.map((g) => gu.add(GagariUtil(g.name, g.rate))).toList();

      // gagariUtilList = gagaris.map((jsonObject) {
      //   String name = jsonObject['name'];
      //   double rate = jsonObject['rate'].toDouble();
      //   return GagariUtil(name, rate);
      // }).toList();
      // print(gagariUtilList);
       
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proffesionals'),
        centerTitle: true,
        backgroundColor: Colors.red[200],
      ),
      body:  ListView.builder(itemCount: profs.length, 
      itemBuilder: (context,index){
        return SizedBox(
          height: 100,
          child: Card(
            elevation: 10,
            child: Center(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${profs[index]["name"]}' ?? ""),
                    Text('${profs[index]["proffesion"]}'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('${profs[index]["subcity"]}'),
                        Text('${profs[index]["phone"]}'),
                      ],
                    )
                    
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}