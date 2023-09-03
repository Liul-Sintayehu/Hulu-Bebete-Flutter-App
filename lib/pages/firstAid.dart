import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';

import '../homePage.dart';
import 'melkPage.dart';

class FirstAid extends StatefulWidget {
  const FirstAid({super.key});

  @override
  State<FirstAid> createState() => _FirstAidState();
}

class _FirstAidState extends State<FirstAid> {
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
                      'First Aid',
                      style: TextStyle(fontSize: 24),
                    ),
                    bottom: 2,
                    left: 2,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  onPressed: () {},
                  child: Text(
                    'Get professionals',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 170,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 5),
                          child: Card(
                            color: const Color.fromARGB(255, 240, 237, 237),
                            elevation: 10,
                            margin: EdgeInsets.all(8),
                            child: Center(
                              child: ListTile(
                                leading: Image.asset(
                                  'images/melkt/wedding.png',
                                ),
                                trailing: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Accidential bleedig',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 5),
                          child: Card(
                            color: const Color.fromARGB(255, 240, 237, 237),
                            elevation: 10,
                            margin: EdgeInsets.all(8),
                            child: Center(
                              child: ListTile(
                                leading: Image.asset(
                                  'images/melkt/wedding.png',
                                ),
                                trailing: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Accidential bleedig',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 5),
                          child: Card(
                            color: const Color.fromARGB(255, 240, 237, 237),
                            elevation: 10,
                            margin: EdgeInsets.all(8),
                            child: Center(
                              child: ListTile(
                                leading: Image.asset(
                                  'images/melkt/wedding.png',
                                ),
                                trailing: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Accidential bleedig',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      MaterialPageRoute(builder: (context) => HomePage()));
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => MelktPage()),
                    ),
                  );
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
