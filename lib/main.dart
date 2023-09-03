import 'package:flutter/material.dart';
//import 'package:login1/homePage.dart';
import 'package:hulubebete/register.dart';
//import 'package:login1/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  bool showHome = prefs.getBool('showHome')?? false;
  runApp( MyApp(showHome:showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key,required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  showHome ? Register() : OnboardingPage(),
    );
  }
}