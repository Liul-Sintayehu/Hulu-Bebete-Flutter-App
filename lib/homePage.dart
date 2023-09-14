import 'package:flutter/material.dart';
import 'package:hulubebete/login.dart';
import 'package:hulubebete/onboarding.dart';
import 'package:hulubebete/pages/firstAid.dart';
import 'package:hulubebete/pages/gagariPage.dart';
import 'package:hulubebete/pages/info.dart';
import 'package:hulubebete/pages/melkPage.dart';
import 'package:hulubebete/pages/partTime.dart';
import 'package:hulubebete/pages/profile.dart';
import 'package:hulubebete/util.dart';
import 'package:hulubebete/pages/wedding.dart';
import 'package:flutter/services.dart';
import 'package:hulubebete/util/myList.dart';
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';
import 'dart:async';

import 'User.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({required this.user, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final search = TextEditingController();
  final skey = GlobalKey<ScaffoldState>();
  double rating = 0;
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;
  int _currentPage = 0;
  int notif = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
    _refreshPage();
  }
  Future<void> _refreshPage() async {
    // Perform any necessary operations here
    setState(() {
      notif = 3; // Update the variable here
    });
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  void _stopAutoScroll() {
    _timer?.cancel();
  }

  void rate() async {
    try {
      final url = "https://fproject1.onrender.com/rate";
      await post(Uri.parse(url), body: {"rate": rating.toString()});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //centerTitle: true,
        title: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              backgroundColor: Colors.yellow[500],
              shape: BeveledRectangleBorder(),
              minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 25)),
          onPressed: () {},
          child: Text(
            'Balance: ${widget.user.balanceu}',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 100,
        leading: SizedBox(
          child: Stack(children: [
            Positioned(
              top: 10,
              left: 10,
              height: 40,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 2, color: Colors.amber)),
                child: Image(
                  image: AssetImage('images/logo3.png'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ]),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Stack(
                  children: [
                    ImageIcon(
                        size: 25,
                        color: Colors.amber,
                        AssetImage('images/notification.png')),
                    Positioned(
                        top: -3,
                        right: -2,

                        child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Text(
                              '$notif',
                              style: TextStyle(color: Colors.white),
                            )))
                  ],
                ),
              ),
              PopupMenuButton<String>(
                icon: ImageIcon(
                    size: 25,
                    color: Colors.black,
                    AssetImage('images/dots.png')),
                onSelected: (value) async {
                  // Handle button click actions here
                  if (value == 'button1') {
                    // Perform action for button1
                    _refreshPage();
                  } else if (value == 'button2') {
                    // Perform action for button2
                  } else if (value == 'button3') {
                    // Perform action for button3
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('showHome', false);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: ((context) => OnboardingPage())));
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'button1',
                    child: Text('refresh'),
                  ),
                  PopupMenuItem(
                    value: 'button2',
                    child: Text('Button 2'),
                  ),
                  PopupMenuItem(
                    value: 'button3',
                    child: Text('Log out'),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 40,
                child: TextField(
                  controller: search,
                  decoration: InputDecoration(
                      suffix: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      suffixIcon: SizedBox(
                          height: 60,
                          child: Icon(
                            size: 30,
                            Icons.search,
                            color: Colors.black,
                          )),
                      contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      fillColor: Colors.grey[300],
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50)),
                      label: const Text(
                        'Search Here',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              height: 200,
              width: double.infinity,
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: [
                  MyWidget(
                      color: Colors.blue[200],
                      path: "images/home/delivery.png"),
                  MyWidget(
                      color: Colors.green[200], path: "images/home/part.jpg"),
                  MyWidget(
                      color: Colors.red[200], path: "images/home/transp.png"),
                  MyWidget(
                      color: Colors.yellow[200], path: "images/home/first.jpg"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Catagories',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PartTime(
                                user: widget.user,
                              )));
                    },
                    child: MyButton(
                      name: 'part time job',
                      color: Colors.grey[200],
                      path: 'images/part.jpg',
                    )),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MelktPage(
                                user: widget.user,
                              )));
                    },
                    child: MyButton(
                        name: 'መልእክተኛው',
                        color: const Color.fromARGB(255, 2, 1, 1),
                        path: 'images/melkt.jpg')),
                GestureDetector(
                  onTap:  (){
                    Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Gagari(
                                user: widget.user,
                              )));
                  },
                  child: MyButton(
                      name: 'ጋጋሪ',
                      color: Colors.grey[200],
                      path: 'images/enjera.png'),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FirstAid(
                              user: widget.user,
                            )));
                  },
                  child: MyButton(
                      name: 'first aid',
                      color: Colors.grey[200],
                      path: 'images/first.png'),
                ),
                MyButton(
                    name: 'ባለ ሱቅ',
                    color: Colors.grey[200],
                    path: 'images/balesuq.png'),
                MyButton(
                    name: 'ethio travel',
                    color: Colors.grey[200],
                    path: 'images/ethiotravel.png')
              ],
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
                          user: widget.user,
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
              onPressed: () {
                //  Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => Info()));
              },
              icon: SizedBox(
                  child: ImageIcon(
                      size: 25,
                      color: Colors.black,
                      AssetImage('images/information-button.png')))),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) => Profile(
                        user: widget.user,
                      )),
                ),
              );
            },
            icon: SizedBox(
              child: ImageIcon(
                  size: 20, color: Colors.black, AssetImage('images/user.png')),
            ),
          ),
        ],
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
}


/*

SizedBox(
          child: Stack(children: [
            Positioned(
              top: 10,
              height: 40,
              child: Image(
                image: AssetImage('images/logo3.png'),
              ),
            )
          ]),
        ),

 */