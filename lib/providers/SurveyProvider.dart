// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/models/Survey.dart';
import 'package:interview_part2_survey_creator/models/SurveyQuestionable.dart';

/*
 * Singleton and ChangeNotifier(Provider):
 * This Service is used for once a survey is selected, then we can run certain functions on it
 * Using Singleton to avoid routing params and so I can access provider w/out consuming it
 * Otherwise accessing the Provider would have to have your widget also consume and be updated by it
 */
class SurveyProvider extends ChangeNotifier {
  Survey survey = Survey(items: []);
  SurveyQuestionable? selectedQuestion;

  static final SurveyProvider _surveyProvider = SurveyProvider._internal();

  SurveyProvider._internal();

  factory SurveyProvider() {
    return _surveyProvider;
  }

  void updateSelectedQuestion(SurveyQuestionable question) {
    selectedQuestion = question;
    notifyListeners();
  }

  void addQuestion(SurveyQuestionable question) {
    survey.items.add(question);
    notifyListeners();
  }

  void removeQuestionByIndex(int rank) {
    // TODO: use index instead of rank
    // bufferSurvey.questions.removeWhere((question) => question.rank == rank);
    notifyListeners();
  }

  void reorderQuestions(int oldQuestionIndex, int newQuestionIndex) {
    // List<SurveyQuestionable> questions = survey.items;
    // final SurveyQuestionable question = questions.removeAt(oldQuestionIndex);
    // questions.insert(newQuestionIndex, question);
    // notifyListeners();
  }
}
