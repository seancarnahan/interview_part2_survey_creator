// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/models/SurveyItemable.dart';
import 'package:interview_part2_survey_creator/pages/surveyQuestionsPage/widgets/foldersView/widgets/QuestionFolder.dart';

// TODO: Rename to Just Folder
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

enum FolderActions {
  Rename,
  Delete,
  NewQuestion,
  NewFolder
}
