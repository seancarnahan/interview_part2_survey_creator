// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'SurveyGroupable.dart';

abstract class SurveyQuestionable implements SurveyGroupable {
  String title;

  SurveyQuestionable({
    required this.title,
  });

  // Fetch extra information from the user needed to create the question
  Widget getForm();

  // Creates a preview of what the question will look like
  Widget getPreview();
}

enum SurveyQuestionType {
  Text,
  Boolean,
  Number,
  MultipleChoice
}

