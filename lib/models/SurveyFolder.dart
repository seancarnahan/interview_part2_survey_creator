import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/models/SurveyItemable.dart';
import 'package:interview_survey_creator_simple/pages/surveyQuestionsPage/widgets/foldersView/widgets/QuestionFolder.dart';

class SurveyFolder implements SurveyItemable {
  String name;
  List<SurveyItemable> items = [];

  final SurveyItemTypes itemType = SurveyItemTypes.Folder;

  SurveyFolder(this.name, this.items);

  @override
  Widget buildItem(int numIndents) {
    return QuestionFolder(numIndents: numIndents, folder: this);
  }
}