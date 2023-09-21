import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';

import '../User.dart';
import '../util/designs.dart';
import 'myData.dart';
import '../homePage.dart';
import 'package:geolocator/geolocator.dart';

class Graduation extends StatefulWidget {
  final User user;
  const Graduation({required this.user, Key? key}) : super(key: key);

  @override
  State<Graduation> createState() => _GraduationState();
}

class _GraduationState extends State<Graduation> {
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
        "teteri": teteris[0].toString(),
        "gps": "21533"
      };
      //  List<Map<String, dynamic>> myMapList = teteris.cast<Map<String, dynamic>>().map((item) => Map<String, dynamic>.from(item)).toList();
      //   MyDataObject myDatas = MyDataObject(
      //     senderName: senderName.text,
      //       info: info.text,
      //       teteri: jsonEncode(object),
      //       gps: "21533"
      //   );
      print(myData);
       final url = "https://fproject1.onrender.com/create";
      var data = await post(Uri.parse(url), body: myData);
      print(data.body);
      
    } catch (e) {
      print(e);
    }
  }
  String tex = '';
  @override
  Widget build(BuildContext context) {
    var user = widget.user;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        
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
                      //fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Text(
                      'Graduation',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    bottom: 10,
                    //  left: 10,
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
                      Designs(color: Colors.red, path: "images/wedding/w1.jpg"),
                      Designs(color: Colors.red, path: "images/wedding/w5.jpg"),
                      Designs(color: Colors.red, path: "images/wedding/w4.jpg"),
                      Designs(color: Colors.red, path: "images/wedding/w3.jpg"),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 40),
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
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePage(
                              user: user,
                            )));
                  },
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
              showSuc('request sent');
              //  if(widget.user.balanceu < 1000){
              //   showSuc('insufficint balance');
              //   print('ins');
              //  }else{
              //   showSuc('succsusfull');
              //   print('suc');
              //  }
            },
            child: Text('Book',
                style: TextStyle(color: Colors.black, fontSize: 24))),
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

  void showSuc(text) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(child: Text(text)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text('successfull!!')],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  FocusScope.of(context).unfocus();
                  new TextEditingController().clear();
                },
                child: Text('Ok'))
          ],
        ),
      );
}
