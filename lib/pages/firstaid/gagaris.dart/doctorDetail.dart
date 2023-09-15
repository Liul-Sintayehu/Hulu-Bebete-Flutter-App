import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hulubebete/pages/wedding.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';

import '../../../User.dart';
import '../../../homePage.dart';
import '../../../util/doctorutil.dart';
import '../../../util/gagari.dart';

class DoctorDetail extends StatefulWidget {
  final DoctorUtil doctor;
  const DoctorDetail({required this.doctor, Key? key}) : super(key: key);

  @override
  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
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
                      'Doctors Details',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    bottom: 2,
                    left: 10,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('images/professionals/d2.png'),
                      fit: BoxFit.fill,
                    ),
                    Text('${widget.doctor.name}'),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
                          child: ElevatedButton(
                            onPressed: () {
                             // sendData();
                              //print('sending');
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                ),
                                backgroundColor: Colors.green[200],
                                shape: BeveledRectangleBorder(),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.17, 30)),
                            child: const Text(
                              'rate',
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                        ),
                        ],
                      ),
                    ),
                      Text('${widget.doctor.rate}'),
                  ],
                ),
              ),
            ),
            Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        child: ElevatedButton(
                          onPressed: () {
                           // sendData();
                            //print('sending');
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              backgroundColor: Colors.yellow[500],
                              shape: BeveledRectangleBorder(),
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.9, 50)),
                          child: const Text(
                            'Send Request',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
            
          ],
        ),
        bottomNavigationBar: NavigationBar(
          height: 55,
          elevation: 5,
          backgroundColor: Colors.grey[200],
          destinations: [
            IconButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => HomePage(
                  //           user: widget.user,
                  //         )));
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
