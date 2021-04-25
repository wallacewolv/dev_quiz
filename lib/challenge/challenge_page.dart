import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgtes/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgtes/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgtes/quiz/quiz_widget.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  ChallengePage({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.linearToEaseOut,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.only(left: 15, top: 15),
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    currentPage: value,
                    lenght: widget.questions.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(
            top: 20,
          ),
          child: PageView(
            physics:
                NeverScrollableScrollPhysics(), // Bloquei de mudar a tela arrastando o dedo para o lado só
            controller: //                      // sendo possivel atraves dos botões Pular ou Confirmar.
                pageController,
            children: widget.questions
                .map(
                  (e) => QuizWidget(
                    question: e,
                    onChange: nextPage,
                  ),
                )
                .toList(),
          ),
        ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (value < widget.questions.length)
                    Expanded(
                      child: NextButtonWidget.white(
                        label: "Pular",
                        onTap: nextPage,
                      ),
                    ),
                  // if (value == widget.questions.length)
                  //   SizedBox(
                  //     width: 10,
                  //   ),
                  if (value == widget.questions.length)
                    Expanded(
                      child: NextButtonWidget.green(
                        label: "Confirmar",
                        onTap: () {
                          Navigator.pop(context);
                        },
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
