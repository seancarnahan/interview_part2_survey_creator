import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interview_part2_survey_creator/providers/QuestionCreatorProvider.dart';
import 'package:interview_part2_survey_creator/models/SurveyQuestionable.dart';
import 'package:interview_part2_survey_creator/widgets/controls/EnvDropdown.dart';
import 'package:interview_part2_survey_creator/widgets/controls/models/EnvDropdownConfig.dart';


class SurveyQuestionTypeDropdown extends StatelessWidget {
  const SurveyQuestionTypeDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
     * Add initial value for dropdown
     */
    return Consumer<QuestionCreatorProvider>(
      builder: (context, questionCreatorProvider, child) {
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: EnvDropdown(
                config: EnvDropdownConfig(
                  items: {
                    'Text': SurveyQuestionType.Text,
                    'Boolean': SurveyQuestionType.Boolean, // Maybe change name to true or false
                    'Number': SurveyQuestionType.Number,
                    'Multiple Choice': SurveyQuestionType.MultipleChoice,
                  },
                  onChanged: (val) => questionCreatorProvider.setNewSurveyQuestion(val)
                )
              )
            ),
            const Expanded(
              flex: 1,
              child: SizedBox()
            )
          ],
        );
      }
    );
  }
}
