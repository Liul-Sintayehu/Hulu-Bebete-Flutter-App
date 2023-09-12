import 'package:flutter/material.dart';

class Heart extends StatelessWidget {
 
  const Heart({ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Heart attack',style: TextStyle(color: Colors.white,fontSize: 25),),
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
              child:const Text('''A heart attack is one of the most common life-threatening heart conditions in the UK.

If you think someone is having or has had a heart attack, call 999 and then move them into a comfortable sitting position.

Symptoms of a heart attack include:

chest pain – the pain is usually located in the centre or left side of the chest and can feel like a sensation of pressure, tightness or squeezing
pain in other parts of the body – it can feel as if the pain is travelling from the chest down 1 or both arms, or into the jaw, neck, back or abdomen (tummy)
Sit the person down and make them comfortable.

If they can, it's best for them to sit on the floor with their knees bent and their head and shoulders supported. If possible, place cushions behind them or under their knees.

If they're conscious, reassure them and ask them to take a 300mg aspirin tablet to chew slowly, (unless you know they shouldn't take aspirin, for example if they are under 16 or they say they are allergic to it).

If the person has any medication for angina, help them to take it.

Monitor their vital signs, such as their breathing, until help arrives.

If the person deteriorates and becomes unconscious, open their airway, check their breathing and, if necessary, start CPR.

Call 999 to tell them you think the person is now in cardiac arrest (their heart has stopped beating).'''),
            ),
          )
        ],
          ),
      ),
    );
  }
}
