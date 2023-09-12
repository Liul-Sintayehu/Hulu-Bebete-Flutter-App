import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hulubebete/pages/parttime/delivery.dart';
import 'package:hulubebete/pages/parttime/firstaid.dart';
import 'package:hulubebete/pages/parttime/gagari.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';

import '../User.dart';
import '../homePage.dart';
import '../util/partTime.dart';
import 'melkPage.dart';

class PartTime extends StatefulWidget {
  final User user;
  const PartTime({required this.user, Key? key}) : super(key: key);

  @override
  State<PartTime> createState() => _PartTimeState();
}

class _PartTimeState extends State<PartTime> {
  String enter = "yes";
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Stack(
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
                      style: TextStyle(fontSize: 21,color:Colors.green,fontWeight: FontWeight.bold),
                       
                    ),
                    bottom: 2,
                    left: 8,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Align(alignment: Alignment.center, child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Text('Part time job availables',
               style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            )),
            SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: GridView(
                  shrinkWrap: true,
                 // physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.18,
                            color: Color.fromARGB(255, 243, 240, 240),
                            child: Image(
                      image: AssetImage('images/parttime/delivery.png'),
                      fit: BoxFit.cover,
                    ),
                          ),
                         Container(
                              height: 30,
                              color: Color.fromARGB(255, 243, 240, 240),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PDelivery(user: widget.user,)));
                                  },
                                  child: Text(
                                    'APPLY NOW',
                                    style: TextStyle(color: Colors.black),
                                  ))),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.18,
                            color: Color.fromARGB(255, 243, 240, 240),
                            child:Image(
                      image: AssetImage('images/parttime/gagari.jpg'),
                      fit: BoxFit.cover,
                    ),
                          ),
                          Container(
                              height: 30,
                              color: Color.fromARGB(255, 243, 240, 240),
                              child: TextButton(
                                  onPressed: () {
                                     Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PGagari(user: widget.user,)));
                                  },
                                  child: Text(
                                    'APPLY NOW',
                                    style: TextStyle(color: Colors.black),
                                  ))),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.18,
                            color: Color.fromARGB(255, 243, 240, 240),
                            child: Image(
                      image: AssetImage('images/first.png'),
                      fit: BoxFit.cover,
                    ),
                          ),
                          Container(
                              height: 30,
                              color: Color.fromARGB(255, 243, 240, 240),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PFirstAid(user: widget.user,)));
                                  },
                                  child: Text(
                                    'APPLY NOW',
                                    style: TextStyle(color: Colors.black),
                                  ))),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.18,
                            color: Color.fromARGB(255, 243, 240, 240),
                             
                          ),
                          Container(
                              height: 30,
                              color: Color.fromARGB(255, 243, 240, 240),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'APPLY NOW',
                                    style: TextStyle(color: Colors.black),
                                  ))),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.18,
                            color: Color.fromARGB(255, 243, 240, 240),
                            
                          ),
                          Container(
                              height: 30,
                              color: Color.fromARGB(255, 243, 240, 240),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'APPLY NOW',
                                    style: TextStyle(color: Colors.black),
                                  ))),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.18,
                            color: Color.fromARGB(255, 243, 240, 240),
                             
                          ),
                          Container(
                              height: 30,
                              color: Color.fromARGB(255, 243, 240, 240),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'APPLY NOW',
                                    style: TextStyle(color: Colors.black),
                                  ))),
                        ],
                      ),
                    ),
                    PartTimeUtil(),
                    PartTimeUtil(),

                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: NavigationBar(
          height: 55,
          elevation: 5,
          backgroundColor: Colors.grey[200],
          destinations: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage(user: widget.user,)));
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
                onPressed: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: ((context) => MelktPage()),
                  //   ),
                  // );
                },
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
                    AssetImage('images/user.png')),
              ),
            ),
          ],
        ),
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
