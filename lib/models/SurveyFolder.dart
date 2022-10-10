import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/models/SurveyGroupable.dart';
import 'package:interview_survey_creator_simple/pages/surveyQuestionsPage/widgets/foldersView/widgets/QuestionFolder.dart';

class SurveyFolder implements SurveyGroupable {
  String name;
  List<SurveyGroupable> items = [];

  SurveyFolder(this.name, this.items);

  @override
  Widget buildGroupItem(int numIndents) {
    return QuestionFolder(numIndents: numIndents, folder: this);
  }
}