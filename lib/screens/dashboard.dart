import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/main.dart';
import 'package:flutter_proj/models/read%20data/get_user_name.dart';
import 'package:flutter_proj/screens/dashboard_controller.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_proj/screens/my_drawer_header.dart';
import 'package:flutter_proj/screens/settings.dart';
import 'package:flutter_proj/screens/signin_screen.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
//import 'package:flutter_proj/screens/signup_screen.dart';

import '../utils/color_utils.dart';
import 'Leaderboard.dart';
import 'dashboard.dart';
import 'Games.dart';
import 'package:flutter_proj/screens/signup_screen.dart';
//import 'package:expansion_tile_card/expansion_tile_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}


class _DashboardPageState extends State<DashboardPage> {
  String email = '', med = '', dob = '', fullname = '';
  
  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;

    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc((firebaseUser.uid))
          .get()
          .then((ds) {
        fullname = ds.data()!['fullname'] ?? [];
        // print(username);
        //age = ds.data()!['age'] ?? [];
        dob= ds.data()!['dob'] ?? [];
        med = ds.data()!['medical condition'] ?? [];
        email = ds.data()!['email'] ?? [];
       // agee = age.toString();
        //print(username);
      }).catchError((e) {
        print(e);
      });
      return (email);
    }
  }
  //final user = FirebaseAuth.instance.currentUser;
   //final DashboardController dashboardController=Get.find();
  /*List<String> docIDs = [];
  Future getDocID() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }*/
  //String email=getVal();
  // void initState(){
  @override

  //final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  //final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
             Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  //padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(400),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            offset: Offset(5, 5))
                      ]),
                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),
            Container(
              
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              
              child: Column(
                
                
                children: <Widget>[
                   const SizedBox(
                  height: 70,
                ),
                              Column(
                                children: <Widget>[
                                  ...ListTile.divideTiles(
                                    color: Colors.blue,
                                    tiles: [
                                      ListTile(
                                          leading: Icon(Icons.date_range),
                                          title: Text("Email"),
                                          subtitle: FutureBuilder(
                                            future: _fetch(),
                                            builder: ((context, snapshot) {
                                              if (snapshot.connectionState !=
                                                  ConnectionState.done){
                                              return Text(
                                                    "Loading data...Please wait");
                                            }
                                            return Text(email);
                                            }
                                          ),
                                          ),
                                          //subtitle: Text(age),
                                          ),
                                      ListTile(
                                        leading:
                                            Icon(Icons.medical_information),
                                        title: Text("Full Name"),
                                        subtitle: FutureBuilder(
                                          future: _fetch(),
                                          builder: ((context, snapshot) {
                                            if (snapshot.connectionState !=
                                                ConnectionState.done){
                                            return Text(
                                                  "Loading data...Please wait");
                                          }
                                          return Text(fullname);
                                          }
                                        ),
                                        ),
                                        //subtitle: Text(med),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.email),
                                        title: Text("Date of Birth"),
                                        subtitle: FutureBuilder(
                                          future: _fetch(),
                                          builder: ((context, snapshot) {
                                            if (snapshot.connectionState !=
                                                ConnectionState.done) {
                                            return Text(
                                                  "Loading data...Please wait");
                                          }
                                           return Text(dob);
                                          }
                                        ),
                                        ),
                                      ),
                                      ListTile(
                                          leading: Icon(Icons.date_range),
                                          title: Text("Medical Condition"),
                                          subtitle: FutureBuilder(
                                            future: _fetch(),
                                            builder: ((context, snapshot) {
                                              if (snapshot.connectionState !=
                                                  ConnectionState.done){
                                              return Text(
                                                    "Loading data...Please wait");
                                            }
                                             return Text(med);
                                            }
                                          ),
                                          ),
                                          //subtitle: Text(age),
                                          ),
                                    ],
                                  ),
                                ],
                              ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

                /*children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 300, // Adjust the height as needed
                    width: double.infinity,
                    child: Expanded(
                      child: FutureBuilder(
                        future: getDocID(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            itemCount: docIDs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: GetUserName(documentID: docIDs[index]),
                                  tileColor:
                                      const Color.fromARGB(255, 17, 51, 79),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
