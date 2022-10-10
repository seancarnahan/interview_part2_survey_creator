import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/mock_old/previewView/widgets/PreviewQuestionContainer.dart';
import 'package:interview_part2_survey_creator/models/SurveyItemable.dart';
import 'package:interview_part2_survey_creator/widgets/controls/EnvRadioButtonController.dart';
import 'package:interview_part2_survey_creator/widgets/controls/models/EnvRadioButtonConfig.dart';
import '../pages/surveyQuestionsPage/widgets/foldersView/widgets/QuestionFile.dart';
import 'SurveyQuestionable.dart';

class SurveyQuestionBoolean implements SurveyQuestionable {
  @override
  String title;

  @override
  int rank;

  final SurveyQuestionType type = SurveyQuestionType.Boolean;

  SurveyQuestionBoolean(this.title, this.rank);

  @override
  Widget getForm() {
    return const SizedBox(height: 0, width: 0);
  }

  @override
  Widget getPreview() {
    return PreviewQuestionContainer(
      title: title,
      rank: rank,
      content: EnvRadioButtonController(
        configs: [
          EnvRadioButtonConfig(
            label: 'True',
            value: '1',
            groupValue: '1',
            onChanged: (dynamic str){}
          ),
          EnvRadioButtonConfig(
            label: 'False',
            value: '2',
            groupValue: '1',
            onChanged: (dynamic str){}
          )
        ]
      )
    );
  }

  @override
  Widget buildItem(int numIndents) {
    // TODO pass SurveyQuestionable type icon -> ex: boolean icon
    return QuestionFile(
      question: this
    );
  }

  @override
  SurveyItemTypes get itemType => SurveyItemTypes.Question;
}
