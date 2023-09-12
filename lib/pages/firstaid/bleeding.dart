import 'package:flutter/material.dart';

class Bleeding extends StatelessWidget {
 
  const Bleeding({ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Bleeding',style: TextStyle(color: Colors.white,fontSize: 25),),
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
              child:const Text('''If someone is bleeding heavily, the main aim is to prevent further blood loss and minimise the effects of shock.
                      
                      First, dial 999 and ask for an ambulance as soon as possible.
                      
                      If you have disposable gloves, use them to reduce the risk of any infection being passed on.
                      
                      Check that there's nothing embedded in the wound. If there is, take care not to press down on the object.
                      
                      Instead, press firmly on either side of the object and build up padding around it before bandaging to avoid putting pressure on the object itself.
                      
                      Do not try to remove it because it may be helping to slow down the bleeding.
                      
                      If nothing is embedded:
                      
                      Apply and maintain pressure to the wound with your gloved hand, using a clean pad or dressing if possible. Continue to apply pressure until the bleeding stops.
                      Use a clean dressing or any clean, soft material to bandage the wound firmly.
                      If bleeding continues through the pad, apply pressure to the wound until the bleeding stops, and then apply another pad over the top and bandage it in place. Do not remove the original pad or dressing, but continue to check that the bleeding has stopped.
                      If a body part, such as a finger, has been severed, place it in a plastic bag or wrap it in cling film. Do not wash the severed limb.
                      
                      Wrap the package in soft fabric and place in a container of crushed ice. Do not let the limb touch the ice.
                      
                      Make sure the severed limb goes with the patient to hospital.
                      
                      Always seek medical help for bleeding, unless it's minor.'''),
            ),
          )
        ],
          ),
      ),
    );
  }
}
