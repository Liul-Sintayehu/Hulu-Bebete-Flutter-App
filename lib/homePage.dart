import 'package:flutter/material.dart';
import 'package:hulubebete/login.dart';
import 'package:hulubebete/onboarding.dart';
import 'package:hulubebete/pages/firstAid.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final search = TextEditingController();
  final skey = GlobalKey<ScaffoldState>();
  double rating = 0;
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
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                        size: 25,
                        color: Colors.amber,
                        AssetImage('images/notification.png')),
                  ),
                  IconButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', false);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: ((context) => OnboardingPage())));
                    },
                    icon: ImageIcon(
                        size: 25,
                        color: Colors.black,
                        AssetImage('images/dots.png')),
                  )
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  MyWidget(color: Colors.blue[200],path: "images/home/delivery.png"),
                  MyWidget(color: Colors.green[200],path: "images/home/part.jpg"),
                  MyWidget(color: Colors.red[200],path: "images/home/transp.png"),
                  MyWidget(color: Colors.yellow[200],path: "images/home/first.jpg"),
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
                  onTap: (){
                     Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PartTime()));
                  },
                    child: MyButton(
                  name: 'part time job',
                  color: Colors.grey[200],
                  path: 'images/part.jpg',
                )),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MelktPage()));
                    },
                    child: MyButton(
                        name: 'መልእክተኛው',
                        color: const Color.fromARGB(255, 2, 1, 1),
                        path: 'images/melkt.jpg')),
                MyButton(
                    name: 'ጋጋሪ',
                    color: Colors.grey[200],
                    path: 'images/enjera.png')
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => FirstAid()));
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
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
                    builder: ((context) => Profile()),
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