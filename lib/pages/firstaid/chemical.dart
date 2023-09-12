import 'package:flutter/material.dart';

class Chemical extends StatelessWidget {
 
  const Chemical({ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text('Chemical burns',style: TextStyle(color: Colors.white,fontSize: 25),),
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
              child:const Text('''For chemical burns, wear protective gloves, remove any affected clothing, and rinse the burn with cool running water for at least 20 minutes to remove the chemical.

If possible, determine the cause of the injury.

In certain situations where a chemical is regularly handled, a specific chemical antidote may be available to use.

Be careful not to contaminate and injure yourself with the chemical, and wear protective clothing if necessary.

Call 999 for immediate medical help.'''),
            ),
          )
        ],
          ),
      ),
    );
  }
}
