import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/mock_old/previewView/widgets/PreviewQuestionContainer.dart';
import 'package:interview_part2_survey_creator/services/KeyboardService.dart';
import 'package:interview_part2_survey_creator/widgets/controls/EnvTextField.dart';
import 'package:interview_part2_survey_creator/widgets/controls/models/EnvTextFieldConfig.dart';
import 'package:interview_part2_survey_creator/widgets/controls/models/NumberFormatter.dart';

// import '../widgets/controls/models/CustomNumberRangeFormatter.dart';
import '../pages/surveyQuestionsPage/widgets/foldersView/widgets/QuestionFile.dart';
import 'SurveyItemable.dart';
import 'SurveyQuestionable.dart';

class SurveyQuestionNumber implements SurveyQuestionable {
  @override
  String title;

  @override
  int rank;

  final SurveyQuestionType type = SurveyQuestionType.Number;

  SurveyQuestionNumber(this.title, this.rank);

  @override
  Widget getForm() {
    return const SizedBox(width: 0, height: 0);

    // TODO: CustomNumberRangeFormatter isint denying values betwee a given range
    // return Column(
    //   children: [
    //     const SizedBox(height: 24),
    //     EnvTextField(
    //       config: EnvTextFieldConfig(
    //         maxLength: 12,
    //         hintText: 'Min Value...',
    //         keyboardType: KeyboardType.numbers,
    //         additionalFormatter: [NumberFormatter()]
    //       ),
    //       onChanged: (value) => {},
    //     ),
    //     const SizedBox(height: 24),
    //     EnvTextField(
    //       config: EnvTextFieldConfig(
    //         maxLength: 12,
    //         hintText: 'Max Value...',
    //         keyboardType: KeyboardType.numbers,
    //         additionalFormatter: [NumberFormatter()]
    //       ),
    //       onChanged: (value) => {},
    //     ),
    //   ],
    // );
  }

  @override
  Widget getPreview() {
    return PreviewQuestionContainer(
      title: title,
      rank: rank,
      content: EnvTextField(
        config: EnvTextFieldConfig(
          maxLength: 500,
          hintText: 'Answer here...',
          keyboardType: KeyboardType.numbers,
          additionalFormatter: [
            NumberFormatter(),
            // CustomNumberRangeFormatter(min: 0, max: 10000)
          ]
        ),
        onChanged: (value) => {},
      ),
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
