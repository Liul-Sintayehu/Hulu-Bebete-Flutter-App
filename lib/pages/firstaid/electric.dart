import 'package:flutter/material.dart';

class Electric extends StatelessWidget {
 
  const Electric({ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text('Electric shock',style: TextStyle(color: Colors.white,fontSize: 25),),
      ),
      body:  SingleChildScrollView(
        child: Column(
        children: [
           Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(width: 1,color: Colors.blue)
              ),
              child:const Text('''If someone has had an electric shock, switch off the electrical current at the mains to break the contact between the person and the electrical supply.

If you can't reach the mains supply:

Do not go near or touch the person until you're sure the electrical supply has been switched off.
Once the power supply has been switched off, and if the person isn't breathing, dial 999 to for an ambulance.
Afterwards, seek medical help.'''),
            ),
          )
        ],
          ),
      ),
    );
  }
}
