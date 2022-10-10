import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interview_part2_survey_creator/providers/SurveyProvider.dart';

import 'widgets/SurveyQuestionCreator.dart';

class QuestionBuilderView extends StatelessWidget {
  const QuestionBuilderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SurveyProvider>(
      builder: (context, surveyProvider, child) {
        // TODO: I think I just want it empty if they currently arent selecting anything
        if (surveyProvider.selectedQuestion == null && !surveyProvider.isAddingQuestion) {
          // return const SurveyNoQuestions();
          return const SizedBox(width: 0, height: 0);
        }
        return SingleChildScrollView(
          child: SurveyQuestionCreator(
            surveyProvider: surveyProvider,
            question: surveyProvider.isAddingQuestion ? null : surveyProvider.selectedQuestion
          ),
        );
      }
    );
  }
}
