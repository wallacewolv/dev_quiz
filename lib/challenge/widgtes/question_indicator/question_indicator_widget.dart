import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int lenght;
  const QuestionIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.lenght,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Questão ${currentPage} ",
                    style: AppTextStyles.body,
                  ),
                ],
              ),
              Text(
                "de $lenght",
                style: AppTextStyles.body,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              child: ProgressIndicatorWidget(
                value: (currentPage / lenght),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
