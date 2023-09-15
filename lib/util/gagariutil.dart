import 'package:flutter/material.dart';
import 'package:hulubebete/util/gagari.dart';
import '../User.dart';

import '../pages/firstaid/gagaris.dart/gagariDetail.dart';
import '../pages/melkPage.dart';

class GagariE extends StatelessWidget {
  final GagariUtil gagaris;
  final User user;
  const GagariE({required this.gagaris, required this.user, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  var gagarix = GagariUtil(
                    gagaris.name,
                    gagaris.rate,
                  );
                  
                  print(gagarix);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GagariDetail(
                            gagari: gagarix,
                            user: user,
                          )));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.15,
                  //color: Color.fromARGB(255, 243, 240, 240),
                  child: Image(
                    image: AssetImage('images/parttime/gagari.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 20,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        gagaris.isNull ? 'Loading' : '${gagaris.name}',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 146, 146, 146)),
                      ))),
                       
            ],
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.height * 0.15,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                      child: Image(
                        image: AssetImage('images/star.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(gagaris.isNull ? 'loading' : '${gagaris.rate.toStringAsFixed(1)}')
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
