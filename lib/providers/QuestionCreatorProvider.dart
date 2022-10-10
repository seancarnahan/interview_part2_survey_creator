import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/models/SurveyQuestionBoolean.dart';
import 'package:interview_part2_survey_creator/models/SurveyQuestionMultipleChoice.dart';
import 'package:interview_part2_survey_creator/models/SurveyQuestionNumber.dart';
import 'package:interview_part2_survey_creator/models/SurveyQuestionText.dart';
import 'package:interview_part2_survey_creator/models/SurveyQuestionable.dart';

class QuestionCreatorProvider extends ChangeNotifier {
  SurveyQuestionable question;

  QuestionCreatorProvider(SurveyQuestionable? existingQuestion): question = existingQuestion ?? SurveyQuestionBoolean('') {
    if (existingQuestion == null) {
      setNewSurveyQuestion(SurveyQuestionType.Text);
    }
  }

  void setNewSurveyQuestion(SurveyQuestionType type) {
    switch (type) {
      case SurveyQuestionType.Text:
        question = SurveyQuestionText(question.title);
        break;
      case SurveyQuestionType.Boolean:
        question = SurveyQuestionBoolean(question.title);
        break;
      case SurveyQuestionType.Number:
        question = SurveyQuestionNumber(question.title);
        break;
      case SurveyQuestionType.MultipleChoice:
        question = SurveyQuestionMultipleChoice(question.title, this);
        break;
      default:
        question = SurveyQuestionText(question.title);
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
}
