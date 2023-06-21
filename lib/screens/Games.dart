import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_proj/screen_quiz/welcome/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_proj/dino/widgets/main_menu.dart';
import 'package:flutter_proj/main.dart';

class GamesPage extends StatefulWidget {
  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Games Page"),
      ),
    );
  }
}

// ignore: camel_case_types
class games extends StatefulWidget {
  const games({super.key});

  @override
  State<games> createState() => _gamesState();
}

class _gamesState extends State<games> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Material(
                      color: const Color.fromARGB(255, 0, 59, 111),
                      //elevation: 8,

                      borderRadius: BorderRadius.circular(50),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JustFlappymain()));
                        },
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Ink.image(
                            image: const AssetImage('assets/images/flappy.png'),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Flappy Bird',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Material(
                      color: const Color.fromARGB(255, 0, 59, 111),
                      //elevation: 8,
                      borderRadius: BorderRadius.circular(50),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Ink.image(
                              image: const AssetImage('assets/images/quiz.png'),
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Quiz',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Material(
                      color: const Color.fromARGB(255, 0, 59, 111),
                      // elevation: 8,
                      borderRadius: BorderRadius.circular(50),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JustDinomain()));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Ink.image(
                              image: const AssetImage(
                                  'assets/images/download.png'),
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Dino Run',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
