import 'package:flutter/material.dart';

class Drowning extends StatelessWidget {
 
  const Drowning({ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[150],
        centerTitle: true,
        title: Text('Drowning',style: TextStyle(color: Colors.white,fontSize: 25),),
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
              child:const Text('''If someone is in difficulty in water, don't enter the water unless it's safe to do so. Don't put yourself at risk.

Once the person is on land, you need to check if they're breathing. Ask someone to call 999 for medical help.

If they're not breathing, open the airway and give 5 initial rescue breaths before starting CPR.

Find out how to give CPR, including rescue breaths.

If the person is unconscious but still breathing, put them into the recovery position with their head lower than their body and call an ambulance immediately.

Continue watching the patient to ensure they don't stop breathing and continue to breathe normally.'''),
            ),
          )
        ],
          ),
      ),
    );
  }
}
