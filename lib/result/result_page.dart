import 'package:DevQuiz/challenge/widgtes/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/home_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int lenght;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.lenght,
    required this.result,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        // alignment: Alignment.center,
        padding: EdgeInsets.only(top: 130),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu ",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: "\n$title",
                        style: AppTextStyles.bodyBold,
                      ),
                      TextSpan(
                        text: "\ncom $result de $lenght acertos.",
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.transparent(
                          label: "Voltar ao início",
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
