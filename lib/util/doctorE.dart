



import 'package:flutter/material.dart';
import 'package:hulubebete/pages/firstaid/gagaris.dart/doctorDetail.dart';
import 'package:hulubebete/util/gagari.dart';



import '../pages/firstaid/gagaris.dart/gagariDetail.dart';
import '../pages/melkPage.dart';
import 'doctorutil.dart';

class DoctorE extends StatelessWidget {
final DoctorUtil doctors;
  const DoctorE({required this.doctors, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 130,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(onTap: (){
             var doctorx = DoctorUtil(doctors.name,doctors.rate);
                    print(doctorx);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DoctorDetail(
                              doctor: doctorx,
                            )));
          },
            child: Card(
            
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 30,
                    child: Image(
                      image: AssetImage('images/professionals/d2.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(doctors.isNull
                          ? 'Loading'
                          : '${doctors.name}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 146, 146, 146)),)),
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
                            Text(doctors.isNull
                                ? 'loading'
                                : '${doctors.rate}')
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
