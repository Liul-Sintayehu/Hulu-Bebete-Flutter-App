import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';

import '../../homePage.dart';
import '../../util/textfield.dart';
 

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
   final name = TextEditingController();
  final phone = TextEditingController();
  final subcity = TextEditingController();
  final paypm = TextEditingController();
  final experiance = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Image(
                      image: AssetImage('images/art.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(bottom: -10,left: 100,
                    child: Container(
                      
                    height: 150,
                    width: 150,
                    
                     child: Image(
                      image: AssetImage('images/pp.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                     
                  )
                ],
              ),
            ),
             
            Text('Name'),
            Text('DiboraYenesew78@gmail.com'),
             
          ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  onPressed: () {},
                  child: Text(
                    'Edit profile',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
          Expanded(
            child: Column(
              children: [
                ListTile(
                   
                  leading: Icon(Icons.settings),
                  title: Padding(
                    padding: const EdgeInsets.only(left:18.0),
                    child: Text('Setting',style:TextStyle(fontSize: 22)),
                  ),
                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined)),
                  
                ),
                ListTile(
               
              leading: Icon(Icons.settings),
              title: Padding(
                padding: const EdgeInsets.only(left:18.0),
                child: Text('User Management',style:TextStyle(fontSize: 22)),
              ),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.person)),
              
            ),
            ListTile(
               
              leading: Icon(Icons.settings),
              title: Padding(
                padding: const EdgeInsets.only(left:18.0),
                child: Text('Information',style:TextStyle(fontSize: 22)),
              ),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.info)),
              
            ),
            ListTile(
               
              leading: Icon(Icons.settings),
              title: Padding(
                padding: const EdgeInsets.only(left:18.0),
                child: Text('Logout',style:TextStyle(fontSize: 22)),
              ),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.logout)),
              
            ),

              ],
            ),
          )
             
          ],
        ),
        bottomNavigationBar: NavigationBar(
          height: 55,
          elevation: 5,
          backgroundColor: Colors.grey[200],
          destinations: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: SizedBox(
                    child: ImageIcon(
                        size: 25,
                        color: Colors.black,
                        AssetImage('images/home (1).png')))),
            IconButton(
                onPressed: () async {
                  String appDir =
                      await getApplicationDocumentsDirectory().then((value) {
                    return '${value.path}/app-release.apk';
                  });
                  Share.shareFiles([appDir], text: 'enjoy the app');
                },
                icon: SizedBox(child: Icon(size: 30, Icons.share))),
            IconButton(
                onPressed: () {
                  //showRating();
                },
                icon: SizedBox(
                    child: ImageIcon(
                        size: 25,
                        color: Color.fromARGB(255, 243, 205, 38),
                        AssetImage('images/star.png')))),
            IconButton(
                onPressed: () {
                   
                },
                icon: SizedBox(
                    child: ImageIcon(
                        size: 25,
                        color: Colors.black,
                        AssetImage('images/information-button.png')))),
            IconButton(
              onPressed: () {},
              icon: SizedBox(
                child: ImageIcon(
                    size: 20,
                    color: Colors.black,
                    AssetImage('images/user.png')),
              ),
            ),
          ],
        ),
      ),
    );
  }

   
   
}
