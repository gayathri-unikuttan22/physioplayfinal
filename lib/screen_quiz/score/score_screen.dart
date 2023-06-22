import 'package:flutter/material.dart';
import 'package:flutter_proj/screens/Games.dart';
import 'package:flutter_proj/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_proj/constants.dart';
import 'package:flutter_proj/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_proj/screen_quiz/welcome/welcome_screen.dart';

import '../../utils/color_utils.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController qnController = Get.put(QuestionController());

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor('20539E'),
              hexStringToColor('20797C'),
              hexStringToColor('209E5A')
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          //SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.cover),
          Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Aligns the column contents in the center
            children: [
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: kSecondaryColor),
              ),
              SizedBox(height: 16), // Adds some spacing between the elements
              Text(
                "${qnController.numOfCorrectAns}/${qnController.questions.length}",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: kSecondaryColor),
              ),
              SizedBox(height: 32), // Adds some spacing between the elements
              ElevatedButton(
                onPressed: () {
                  // Navigation logic goes here
                  // You can use Get.to() or Get.off() to navigate to the desired page
                  Get.to(WelcomeScreen());
                  //  Navigator.pop(context);
                },
                child: Text(
                  "Restart",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.black),
                ),
              ),
              SizedBox(height: 32), // Adds some spacing between the elements
              ElevatedButton(
                onPressed: () {
                  // Navigation logic goes here
                  // You can use Get.to() or Get.off() to navigate to the desired page
                  // Get.back();
                  // Get.back();
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  // Get.to(games());
                  // Get.offNamedUntil('/games', (route) => false);
                },
                child: Text(
                  "Exit",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
