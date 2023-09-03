import 'package:flutter/material.dart';

import '../pages/melkPage.dart';

class PartTimeUtil extends StatelessWidget {
   
  const PartTimeUtil({super.key});
   
  @override
  Widget build(BuildContext context) {
    return Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.18,
                            color: Color.fromARGB(255, 243, 240, 240),
                          ),
                          Container(
                              height: 30,
                              color: Color.fromARGB(255, 243, 240, 240),
                              child: TextButton(
                                  onPressed: () {
                                    
                                  },
                                  child: Text(
                                    'APPLY NOW',
                                    style: TextStyle(color: Colors.black),
                                  ))),
                        ],
                      ),
                    );
  }
}
