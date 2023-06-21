import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:flutter_proj/main.dart';
import 'package:flutter_proj/models/Questions.dart';
import 'package:flutter_proj/screen_quiz/score/score_screen.dart';

import '../screen_quiz/quiz/quiz_screen.dart';
import '../screens/home_screen.dart';

// We use get package for our state management

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Lets animated our progress bar

  late AnimationController _animationController;
  Animation? _animation;
  // so that we can access our animation outside
  Animation? get animation => _animation;

  late PageController _pageController;
  PageController? get pageController => _pageController;

  List<Question> listRandomQuestions = [];

  void generateRandomQuestions() {
    List<Map<String, dynamic>> randomQuestions = [];
    final random = Random();
    while (randomQuestions.length < 5) {
      int randomIndex = random.nextInt(sample_data.length);
      bool found = false;
      randomQuestions.forEach((element) {
        if (element["id"] == sample_data[randomIndex]["id"]) {
          found = true;
          // break;
        }
      });
      if (!found) {
        randomQuestions.add(sample_data[randomIndex]);
      }
      listRandomQuestions = randomQuestions
          .map(
            (question) => Question(
              id: question['id'],
              question: question['question'],
              options: question['options'],
              answer: question['answer_index'],
            ),
          )
          .toList();
    }
  }

  List<Question> get questions {
    return listRandomQuestions;
  }
  // List<Question> get questions => ;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int? _correctAns;
  int? get correctAns => _correctAns;

  int? _selectedAns;
  int? get selectedAns => _selectedAns;

  // for more about obs please check documentation
  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: const Duration(seconds: 15), vsync: this);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();

    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();

    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // It will stop the counter
    _animationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    // Future.delayed(const Duration(seconds: 3), () {
    //   nextQuestion();
    // });
  }

  void nextQuestion() {
    checkAns(changer.myQuestion, changer.selectedOpt_quiz);
    Future.delayed(const Duration(seconds: 4), () {
      if (_questionNumber.value != questions.length) {
        _isAnswered = false;
        _pageController.nextPage(
            duration: const Duration(milliseconds: 250), curve: Curves.ease);

        // Reset the counter
        _animationController.reset();

        // Then start it again
        // Once flutter_proj is finish go to the next qn

        changer.selectedOpt_quiz = 0;
        changer.notify();

        _animationController.forward().whenComplete(nextQuestion);
      } else {
        // Get package provide us simple way to naviigate another page
        print('execute...');
        print('Kiran');
        print('Kiran');
        print('Kiran');
        print('Kiran');
        print('Kiran');
        Get.off(const ScoreScreen());
      }
    });
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
