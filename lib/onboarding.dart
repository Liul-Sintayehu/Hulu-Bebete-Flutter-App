import 'package:flutter/material.dart';
import 'package:hulubebete/register.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(bottom: 80),
          child: PageView(
            
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            controller: controller,
            children: [
              Container(
                 width:double.infinity,
                child: Image(image: AssetImage('images/onbored1.png'),fit: BoxFit.cover,),
              ),
              Container(
                 width:double.infinity,
                child: Image(image: AssetImage('images/onbored2.png'),fit: BoxFit.cover),
              ),
              Container(
                width:double.infinity,
                child: Image(image: AssetImage('images/onbored3.png'),fit: BoxFit.cover),
              ),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.fromHeight(80),
               
                 
                backgroundColor: Colors.amber[200]
              ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: ((context) => Register())));
                },
                child: Text('Get Started',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)))
            : Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          controller.jumpToPage(2);
                        },
                        child: Text('SKIP')),
                    Center(
                        child: SmoothPageIndicator(
                            controller: controller, count: 3)),
                    TextButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: Text('NEXT')),
                  ],
                ),
              ),
      ),
    );
  }
}
