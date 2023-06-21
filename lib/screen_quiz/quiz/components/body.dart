import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_proj/constants.dart';
import 'package:flutter_proj/controllers/question_controller.dart';
import 'package:flutter_proj/models/Questions.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/color_utils.dart';
import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  QuestionController questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    questionController.generateRandomQuestions();
    return Stack(
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
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              const SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${questionController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                          text: "/${questionController.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: kSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 1.5),
              const SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: const NeverScrollableScrollPhysics(),
                  controller: questionController.pageController,
                  onPageChanged: questionController.updateTheQnNum,
                  itemCount: questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                      question: questionController.questions[index]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
