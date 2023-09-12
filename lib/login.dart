import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hulubebete/home.dart';
import 'package:hulubebete/homePage.dart';
import 'package:hulubebete/register.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';

import 'User.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();

  bool isLoading = false;
  String wrong = '';
  var col = Colors.white;

  void login() async {
    try {
      final url = "https://fproject1.onrender.com/login";
      
      final data = await post(Uri.parse(url),
          body: {"email": email.text, "password": password.text});
      String uname = jsonDecode(data.body)["message"];
      if (uname == 'exists') {
        setState(() {
          isLoading = false;
        });
      //  User user1 = User('znaye', '123');
       final names = await jsonDecode(data.body)["user"]["name"];
      final emails = await jsonDecode(data.body)["user"]["email"];
      final passwords = await jsonDecode(data.body)["user"]["password"];
      final int balances = await jsonDecode(data.body)["user"]["balance"];
      User user1 =  User(names, emails, passwords, balances.toDouble());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => HomePage(user: user1,)),
          ),
        );
         
      } else {
        setState(() {
          isLoading = false;
          wrong = 'invalid credentials';
          col = Colors.red;
        });
      }
    } catch (e) {
      print(e);
    }
  }

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
                    'Welcome back',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
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
              height: 20,
            ),
            SizedBox(
                height: 90,
                child: const Image(image: AssetImage('images/logo3.png'))),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                new TextEditingController().clear();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(),
                color: Colors.white,
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
                            controller: email,
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                contentPadding:
                                    EdgeInsets.fromLTRB(50, 0, 0, 0),
                                fillColor: Colors.grey[300],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)),
                                label: const Text(
                                  'Enter your password',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isLoading = true;
                            });
                            //final result = Connectivity().checkConnectivity;
                            //print(result!=ConnectivityResult.none);
                            login();
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
                            'Login',
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
                          Text('Don\'t have an account ?'),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Register()));
                            },
                            child: Text('Sign up',
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            color: col,
                            width: double.infinity,
                            height: 60,
                            child: Center(
                              child: Text(
                                wrong,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            )),
                      )
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
/*
onPressed: () {
                        setState(() {
                          isLoading = true;
                        });

                        login();
                      },

 */

/*

SizedBox(
                      height: 10,
                    ),
                    isLoading
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(width: 25,),
                              Text('loading')
                            ],
                          )
                        : Text(''),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          color: col,
                          width: double.infinity,
                          height: 60,
                          child: Center(
                            child: Text(
                              wrong,
                              style: TextStyle(color: Colors.white,fontSize: 18),
                            ),
                          )),
                    )

 */