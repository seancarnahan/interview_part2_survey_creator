// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

// Item refers to both folders and questions
abstract class SurveyItemable {

  Widget buildItem(int numIndents);
}

enum SurveyItemTypes {
  Folder,
  Question
}
