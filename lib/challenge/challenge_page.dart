import 'package:DevQuiz/challenge/widgtes/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgtes/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgtes/quiz/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SafeArea(
            top: true,
            child: QuestionIndicatorWidget(),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(
            top: 20,
          ),
          child: QuizWidget(
            title: "O que o Flutter faz em sua totalidade?",
          ),
        ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: NextButtonWidget.white(
                    label: "Pular",
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: NextButtonWidget.green(
                    label: "Confirmar",
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
