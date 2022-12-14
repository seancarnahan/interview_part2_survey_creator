import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/pages/surveyQuestionsPage/widgets/foldersView/widgets/QuestionFile.dart';
import 'package:interview_part2_survey_creator/pages/surveyQuestionsPage/widgets/questionBuilderView/widgets/PreviewQuestionContainer.dart';
import 'package:interview_part2_survey_creator/providers/SurveyProvider.dart';
import 'package:interview_part2_survey_creator/services/KeyboardService.dart';
import 'package:interview_part2_survey_creator/widgets/controls/EnvTextField.dart';
import 'package:interview_part2_survey_creator/widgets/controls/models/EnvTextFieldConfig.dart';

import 'SurveyItemable.dart';
import 'SurveyQuestionable.dart';

class SurveyQuestionText implements SurveyQuestionable {
  @override
  String title;

  final SurveyQuestionType type = SurveyQuestionType.Text;

  SurveyQuestionText(this.title);

  @override
  Widget getForm() {
    return const SizedBox(height: 0, width: 0);
  }

  @override
  Widget getPreview() {
    return PreviewQuestionContainer(
      title: title,
      content: EnvTextField(
        config: EnvTextFieldConfig(
          maxLength: 500,
          hintText: 'Answer here...',
          keyboardType: KeyboardType.charsAndNumbersAndSpaces
        ),
        onChanged: (value) => {},
      ),
    );
  }

  @override
  Widget buildItem(int numIndents) {
    // TODO pass SurveyQuestionable type icon -> ex: boolean icon
    return QuestionFile(
      question: this,
      isSelected: identical(SurveyProvider().selectedQuestion, this),
    );
  }

  @override
  SurveyItemTypes get itemType => SurveyItemTypes.Question;
}
