import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hulubebete/homePage.dart';

import 'User.dart';
import 'home.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final repassword = TextEditingController();
  bool isLoading = false;

  //www.mysoftwarefree.com
  void sendData() async {
    try {
      setState(() {
        isLoading = true;
      });

      print(password.text + repassword.text);
      if (password.text != repassword.text) {
        //throw Exception;

        print('diifre');
      }
      final url = 'https://fproject1.onrender.com/signup';
      print(name.text + email.text + password.text);
      await post(Uri.parse(url), body: {
        "name": name.text,
        "email": email.text,
        "password": password.text
      });

      //User user1 = User('znaye', '123');
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => HomePage()),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  // void login() async {
  //   try {
  //     final url = "https://fproject1back.onrender.com/login";
  //     final data = await post(Uri.parse(url),
  //         body: {"email": 'znaye', "password": 'aljz'});
  //     print(data.body);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  String fut = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Best helping hand for you',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 71, 70, 70),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
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
                            controller: email,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(50, 0, 0, 0),
                                fillColor: Colors.grey[300],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)),
                                label: const Text(
                                  'Enter your email',
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
                            controller: password,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(50, 0, 0, 0),
                                fillColor: Colors.grey[300],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)),
                                label: const Text(
                                  'Enter password',
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
                            controller: repassword,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(50, 0, 0, 0),
                                fillColor: Colors.grey[300],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)),
                                label: const Text(
                                  'Comfirm password',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            sendData();
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
                            'Register',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('I have an account ?'),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login()));
                            },
                            child: Text('Log in',
                                style: TextStyle(color: Colors.yellow)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(
                                  width: 25,
                                ),
                                Text('loading')
                              ],
                            )
                          : Text(''),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
