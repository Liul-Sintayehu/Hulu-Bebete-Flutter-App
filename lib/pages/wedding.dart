import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';

import '../util/designs.dart';
import 'myData.dart';

class Wedding extends StatefulWidget {
  const Wedding({super.key});

  @override
  State<Wedding> createState() => _WeddingState();
}

class _WeddingState extends State<Wedding> {
  final senderName = TextEditingController();
  final info = TextEditingController();
  final rec = TextEditingController();
  List<Widget> x = [];
  int no = 0;
  List<TextEditingController> rncontroller = [];
  List<TextEditingController> racontroller = [];
  double rating = 0;

  void send() async {
    no = int.tryParse(rec.text)!;
    List teteris = [];

    try {
      for (int i = 0; i < no; i++) {
        String name = rncontroller[i].text;
        String address = racontroller[i].text;
        teteris.add(name);
      }
      // Map<String,dynamic>
      var myData = {
        "senderName": senderName.text,
        "info": info.text,
        "teteri": "abebe",
        "gps": "21533"
      };
      //  List<Map<String, dynamic>> myMapList = teteris.cast<Map<String, dynamic>>().map((item) => Map<String, dynamic>.from(item)).toList();
      //   MyDataObject myDatas = MyDataObject(
      //     senderName: senderName.text,
      //       info: info.text,
      //       teteri: jsonEncode(object),
      //       gps: "21533"
      //   );
      final url = "https://fproject1.onrender.com/create";
      await post(Uri.parse(url), body: myData);
      print("sending");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Image(
                      image: AssetImage('images/art.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Text(
                      'Part Time Job',
                      style: TextStyle(fontSize: 24),
                    ),
                    bottom: 2,
                    left: 2,
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sender Name: '),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        controller: senderName,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                            fillColor: Colors.grey[300],
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)),
                            label: const Text(
                              'Enter sender name',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Words: '),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        controller: info,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                            fillColor: Colors.grey[300],
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)),
                            label: const Text(
                              'Enter sentence',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Number of guest'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: TextField(
                        controller: rec,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                            fillColor: Colors.grey[300],
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)),
                            label: const Text(
                              'number of reciever',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Designs(color: Colors.red, path: "images/logo3.png"),
                      Designs(color: Colors.red, path: "images/logo3.png"),
                      Designs(color: Colors.red, path: "images/logo3.png"),
                      Designs(color: Colors.red, path: "images/logo3.png"),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 30),
                  backgroundColor: Colors.yellow,
                ),
                onPressed: () {
                  showReciever();
                },
                child: Text(
                  'Enter',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                child: Column(
                  children: x,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
            height: 55,
            elevation: 5,
            backgroundColor: Colors.grey[200],
            destinations: [
              IconButton(
                  onPressed: () {},
                  icon: SizedBox(
                      child: ImageIcon(
                          size: 25,
                          color: Colors.black,
                          AssetImage('images/home (1).png')))),
              IconButton(
                  onPressed: () async {
                    String appDir =
                        await getApplicationDocumentsDirectory().then((value) {
                      return '${value.path}/app-release.apk';
                    });
                    Share.shareFiles([appDir], text: 'enjoy the app');
                  },
                  icon: SizedBox(child: Icon(size: 30, Icons.share))),
              IconButton(
                  onPressed: () {
                    showRating();
                  },
                  icon: SizedBox(
                      child: ImageIcon(
                          size: 25,
                          color: Color.fromARGB(255, 243, 205, 38),
                          AssetImage('images/star.png')))),
              IconButton(
                  onPressed: () {},
                  icon: SizedBox(
                      child: ImageIcon(
                          size: 25,
                          color: Colors.black,
                          AssetImage('images/information-button.png')))),
              IconButton(
                  onPressed: () {},
                  icon: SizedBox(
                      child: ImageIcon(
                          size: 20,
                          color: Colors.black,
                          AssetImage('images/user.png')))),
            ]),
      ),
    );
  }

  void showReciever() {
    no = int.tryParse(rec.text)!;
    int.tryParse(rec.text);
    List<Widget> y = [];
    for (int i = 0; i < double.parse(rec.text); i++) {
      var rn = TextEditingController();
      var ra = TextEditingController();
      rncontroller.add(rn);
      racontroller.add(ra);
    }
    for (int i = 0; i < int.tryParse(rec.text)!; i++) {
      y.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: TextField(
                controller: rncontroller[i],
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    fillColor: Colors.grey[300],
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50)),
                    label: const Text(
                      'Enter name',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: TextField(
                  controller: racontroller[i],
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                      fillColor: Colors.grey[300],
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50)),
                      label: const Text(
                        'Enter address',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
          ],
        ),
      );

      setState(() {
        x = y;
      });
    }
    y.add(
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width, 50),
              backgroundColor: Colors.yellow,
            ),
            onPressed: () {
              send();
            },
            child: Text('Book',style:TextStyle(color: Colors.black,fontSize: 24))),
      ),
    );
  }

  void showRating() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(child: Text('Rate this app')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RatingBar.builder(
                  unratedColor: Colors.grey[400],
                  glow: false,
                  allowHalfRating: true,
                  itemBuilder: (context, _) => ImageIcon(
                      color: Colors.amber, AssetImage('images/star.png')),
                  onRatingUpdate: (rate) => setState(() {
                        this.rating = rate;
                      })),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  rate();
                  Navigator.of(context).pop();
                  FocusScope.of(context).unfocus();
                  new TextEditingController().clear();
                  print(rating);
                  rating = 0;
                },
                child: Text('Rate'))
          ],
        ),
      );

  void rate() async {
    try {
      final url = "https://fproject1.onrender.com/rate";
      await post(Uri.parse(url), body: {"rate": rating});
    } catch (e) {
      print(e);
    }
  }
}
