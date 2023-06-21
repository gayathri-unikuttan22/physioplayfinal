import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_proj/screens/my_drawer_header.dart';
import 'package:flutter_proj/screens/settings.dart';
import 'package:flutter_proj/screens/signin_screen.dart';
//import 'package:flutter_proj/screens/signup_screen.dart';

import '../utils/color_utils.dart';
import 'Leaderboard.dart';
import 'dashboard.dart';
import 'Games.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.Leaderboard) {
      container = progressPage();
    } else if (currentPage == DrawerSections.Games) {
      container = games();
    } else if (currentPage == DrawerSections.signin_screen) {
      container = SignInScreen();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    }
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 28, 127, 232),
        title: Text("Physioplay"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromARGB(255, 33, 150, 243),
                  Color(0xFF059362)
                ]),
          ),
        ),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Progress", Icons.people_alt_outlined,
              currentPage == DrawerSections.Leaderboard ? true : false),
          menuItem(3, "Games", Icons.games_outlined,
              currentPage == DrawerSections.Games ? true : false),
          menuItem(4, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          const Divider(),
          Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: Text("Logout"),
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Signed Out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                  });
                },
              ))
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.Leaderboard;
            } else if (id == 3) {
              currentPage = DrawerSections.Games;
            } else if (id == 4) {
              currentPage = DrawerSections.settings;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  Leaderboard,
  Games,
  settings,
  signin_screen,
}
