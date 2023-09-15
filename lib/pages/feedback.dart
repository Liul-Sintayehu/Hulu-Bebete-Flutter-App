import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hulubebete/home.dart';
import 'package:hulubebete/homePage.dart';
import 'package:hulubebete/register.dart';

import '../User.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';


class Feedbacks extends StatefulWidget {
  final User user;
  const Feedbacks({required this.user, Key? key}) : super(key: key);

  @override
  State<Feedbacks> createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  final subject = TextEditingController();
  final message = TextEditingController();

  bool isLoading = false;
  String wrong = '';
  var col = Colors.white;

  void login() async {
    try {
       final url = 'https://fproject1.onrender.com/feedback';
       var data = await post(Uri.parse(url), body: {
        "email": widget.user.emailu,
        "subject": subject.text,
        "message": message.text
      });
       
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
                    'Give us your feedback',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                   
                ],
              ),
            ),
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
                            controller: subject,
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
                                  'Enter the subject',
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
                        child: Container(
                          height: 200,
                          child: TextField(
                            maxLines: null,
                            controller: message,
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
                                  'Enter the message',
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
                          onPressed: ()  {
                             
                            //final result = Connectivity().checkConnectivity;
                            //print(result!=ConnectivityResult.none);
                             login();
                             showSuc('feedback sent');
                              subject.text = "";
                              message.text = "";
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
                            'Send Feedback',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      
                      SizedBox(
                        height: 10,
                      ),
                       
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
  void showSuc(text) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          // title: Center(child: Text('Registration complete')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text(text)],
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