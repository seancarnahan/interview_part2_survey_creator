import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/models/SurveyQuestionBoolean.dart';
import 'package:interview_part2_survey_creator/models/SurveyQuestionMultipleChoice.dart';
import 'package:interview_part2_survey_creator/models/SurveyQuestionNumber.dart';
import 'package:interview_part2_survey_creator/models/SurveyQuestionText.dart';
import 'package:interview_part2_survey_creator/models/SurveyQuestionable.dart';

class QuestionCreatorProvider extends ChangeNotifier {
  SurveyQuestionable question;

  QuestionCreatorProvider(): question = SurveyQuestionText('', 1) {
    setNewSurveyQuestion(SurveyQuestionType.Text);
  }

  void setNewSurveyQuestion(SurveyQuestionType type) {
    int rank = _getRank();
    switch (type) {
      case SurveyQuestionType.Text:
        question = SurveyQuestionText(question.title, rank);
        break;
      case SurveyQuestionType.Boolean:
        question = SurveyQuestionBoolean(question.title, rank);
        break;
      case SurveyQuestionType.Number:
        question = SurveyQuestionNumber(question.title, rank);
        break;
      case SurveyQuestionType.MultipleChoice:
        question = SurveyQuestionMultipleChoice(question.title, rank, this);
        break;
      default:
        question = SurveyQuestionText(question.title, rank);
    }
    notifyListeners();
  }

  void updateQuestionTitle(String text) {
    question.title = text;
    notifyListeners();
  }

  void updateQuestion() {
    notifyListeners();
  }

  int _getRank() {
    return 1;
    // int numQuestions = SurveyProvider().bufferSurvey.questions.length;
    // return numQuestions + 1;
  }
}
