import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/pages/surveyQuestionsPage/widgets/questionBuilderView/widgets/SurveyNoQuestions.dart';
import 'package:interview_part2_survey_creator/providers/SurveyProvider.dart';
import 'package:provider/provider.dart';

import 'widgets/SurveyQuestionCreator.dart';

class QuestionBuilderView extends StatelessWidget {
  const QuestionBuilderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SurveyProvider>(
      builder: (context, surveyProvider, child) {
        if (surveyProvider.selectedQuestion == null && !surveyProvider.isAddingQuestion) {
          return const SurveyNoQuestions();
        }
        return SurveyQuestionCreator(surveyProvider: surveyProvider);
      }
    );
  }
}
