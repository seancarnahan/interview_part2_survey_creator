import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interview_part2_survey_creator/services/ScreenSizeService.dart';
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

// TODO: Break down into smaller widgets
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
    bool isMobile = MediaQuery.of(context).size.width < ScreenSizeService.MobileBreakpointDown;
    QuestionCreatorProvider questionCreatorProvider = QuestionCreatorProvider(question);
    return ChangeNotifierProvider<QuestionCreatorProvider>.value(
      value: questionCreatorProvider,
      child: Consumer<QuestionCreatorProvider>(
        builder: (context, questionCreatorProvider, child) {
          return ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 572),
            child: Container(
              padding: EdgeInsets.only(left: isMobile ? 24 : 112, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: isMobile ? 32 : 80),
                  /* Creator Form */
                  if (question == null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Edit', style: BrandedTextStyle.b1Reg(BrandedColors.primary500)),
                        SizedBox(height: isMobile ? 32 : 40),
                        const SurveyQuestionTypeDropdown(),
                        const SizedBox(height: 24),
                        EnvTextField(
                          config: EnvTextFieldConfig(
                            maxLength: 500,
                            // TODO: Would like to use InitialText here, but something is getting stuck when you switch selected question
                            hintText: questionCreatorProvider.question.title.isEmpty ? 'Input Question here...' : questionCreatorProvider.question.title,
                            keyboardType: KeyboardType.noRestrictions
                          ),
                          onChanged: (value) => questionCreatorProvider.updateQuestionTitle(value),
                        ),
                        questionCreatorProvider.question.getForm(),
                        const SizedBox(height: 112),
                      ],
                    ),

                  /* Preview */
                  Text('Preview', style: BrandedTextStyle.b1Reg(BrandedColors.primary500)),
                  SizedBox(height: isMobile ? 32 : 40),
                  questionCreatorProvider.question.getPreview(),
                  const SizedBox(height: 32),
                  Visibility(
                    visible: question == null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        EnvButton(
                          buttonText: 'Cancel',
                          color: BrandedColors.gray300,
                          useAutoWidth: false,
                          onClick: () {
                            surveyProvider.updateIsAddingQuestion(false);
                          }
                        ),
                        const SizedBox(width: 24),
                        EnvButton(
                          buttonText: 'Save',
                          useAutoWidth: false,
                          onClick: () {
                            if (question == null) {
                              surveyProvider.addQuestion(questionCreatorProvider.question);  
                              surveyProvider.updateIsAddingQuestion(false);
                            }
                          }
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            )
          );
        }
      ),
    );
  }
}
