import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interview_part2_survey_creator/models/SurveyQuestionable.dart';
import 'package:interview_part2_survey_creator/providers/QuestionCreatorProvider.dart';
import 'package:interview_part2_survey_creator/providers/SurveyProvider.dart';
import 'package:interview_part2_survey_creator/widgets/button/EnvButton.dart';
import 'package:interview_part2_survey_creator/services/KeyboardService.dart';
import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';
import 'package:interview_part2_survey_creator/styles/BrandedTextStyle.dart';
import 'package:interview_part2_survey_creator/widgets/controls/EnvTextField.dart';
import 'package:interview_part2_survey_creator/widgets/controls/models/EnvTextFieldConfig.dart';

import 'SurveyQuestionTypeDropdown.dart';

class SurveyQuestionCreator extends StatelessWidget {
  final SurveyProvider surveyProvider;
  final SurveyQuestionable? question;
  const SurveyQuestionCreator({
    Key? key,
    required this.surveyProvider,
    this.question
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
      * Question Type
      * Question Title
      * Question Form
      * Edit Question vs CreateNew question
     */

    return ChangeNotifierProvider<QuestionCreatorProvider>(
      create: (context) => QuestionCreatorProvider(),
      child: Consumer<QuestionCreatorProvider>(
        builder: (context, questionCreatorProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* Creator Form */
              const SurveyQuestionTypeDropdown(),
              const SizedBox(height: 24),
              EnvTextField(
                config: EnvTextFieldConfig(
                  maxLength: 500,
                  hintText: 'Input Question here...',
                  initialText: question?.title ?? '',
                  keyboardType: KeyboardType.noRestrictions
                ),
                onChanged: (value) => questionCreatorProvider.updateQuestionTitle(value),
              ),
              question?.getForm() ?? questionCreatorProvider.question.getForm(),
              const SizedBox(height: 32),

              /* Preview */
              Text('Preview', style: BrandedTextStyle.b1Reg(BrandedColors.primary500)),
              const SizedBox(height: 24),
              questionCreatorProvider.question.getPreview(),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 24),
                  EnvButton(
                    buttonText: 'Save',
                    useAutoWidth: false,
                    onClick: () {
                      surveyProvider.addQuestion(questionCreatorProvider.question);
                      surveyProvider.updateIsAddingQuestionToRoot(false);
                    }
                  ),
                ],
              ),
            ],
          );
        }
      ),
    );
  }
}