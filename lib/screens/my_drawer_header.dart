import 'package:flutter/material.dart';
import 'package:flutter_proj/screens/signup_screen.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_proj/utils/color_utils.dart';

import '../reusable_widgets/reusable.dart';
import 'home_screen.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        hexStringToColor('20539E'),
        hexStringToColor('20797C'),
        hexStringToColor('209E5A')
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile.png'),
                )),
          ),
          const Text(
            "User",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontStyle: FontStyle.normal),
          ),
        ],
      ),
    );
  }
}
