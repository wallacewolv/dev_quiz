import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';

class HomeController {
  HomeState state = HomeState.empty;

  UserModel? user;
  List<QuizModel>? quizzes;

  void GetUser() {
    user = UserModel(
      name: "Wallace",
      photoUrl: "https://avatars.githubusercontent.com/u/65473975?v=4",
    );
  }

  void getQuizzes() {
    quizzes = [
      QuizModel(
          title: "NLW 5 Flutter",
          imagem: AppImages.blocks,
          level: Level.facil,
          questions: [
            QuestionModel(
              title: "Está curtindo o Flutter?",
              awnsers: [
                AwnserModel(title: "Estou curtindo"),
                AwnserModel(title: "Amando Flutter"),
                AwnserModel(title: "Muito top"),
                AwnserModel(title: "Show de bola!", isRight: true),
              ],
            ),
          ])
    ];
  }
}
