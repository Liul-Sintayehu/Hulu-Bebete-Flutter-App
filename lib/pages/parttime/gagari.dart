import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';

import '../../User.dart';
import '../../homePage.dart';
import '../../util/textfield.dart';
 

class PGagari extends StatefulWidget {
  final User user;
  const PGagari({required this.user, Key? key}) : super(key: key);

  @override
  State<PGagari> createState() => _PGagariState();
}

class _PGagariState extends State<PGagari> {
   final name = TextEditingController();
  final phone = TextEditingController();
  final subcity = TextEditingController();
  final paypm = TextEditingController();
  final experiance = TextEditingController();

   void sendData() async {
    try {
       

       
       
      final url = 'https://fproject1.onrender.com/creategagari';
      var data = {
        "name": name.text,
        "phone": phone.text,
        "subcity": subcity.text,
      };
       
      var resp = await post(Uri.parse(url), body: data);
     print(resp.body);
      //User user1 = User('znaye', '123');
      // ignore: use_build_context_synchronously
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: ((context) => HomePage()),
      //   ),
      // );
    } catch (e) {
      print(e);
    }
  }


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
                      style: TextStyle(fontSize: 24),
                    ),
                    bottom: 2,
                    left: 2,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text('Gagari job'),
            SizedBox(
              height: 50,
            ),
            Expanded(
              flex: 5,
              child: GestureDetector(
              onTap: () {
                print('oo');
                FocusScope.of(context).unfocus();
                new TextEditingController().clear();
              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
                          child: SizedBox(
                            height: 40,
                            child: TextField(
                              controller: name,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(50, 0, 0, 0),
                                  fillColor: Colors.grey[300],
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(50)),
                                  label: const Text(
                                    'Enter your name',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
                          child: SizedBox(
                            height: 40,
                            child: TextField(
                              controller: phone,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(50, 0, 0, 0),
                                  fillColor: Colors.grey[300],
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(50)),
                                  label: const Text(
                                    'Enter your phone number',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
                          child: SizedBox(
                            height: 40,
                            child: TextField(
                              controller: paypm,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(50, 0, 0, 0),
                                  fillColor: Colors.grey[300],
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(50)),
                                  label: const Text(
                                    'Enter subcity',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ),
                        MyTextField(label: 'Enter payment/minute',txtcont:paypm ),
                        MyTextField(label: 'Enter experiance',txtcont:experiance ),
                        SizedBox(height: 60),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
                          child: ElevatedButton(
                            onPressed: () {
                             sendData();
                              //print('sending');
                              showSuc();
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
                              'APPLY',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        
                         
                      ],
                    ),
                  ),
                ),
              ),
            )
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
                  //showRating();
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

   void showSuc() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(child: Text('Registration complete')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Text('successfull!!!')
            ],
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
