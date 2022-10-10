import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/models/SurveyFolder.dart';
import 'package:interview_survey_creator_simple/models/SurveyQuestionBoolean.dart';
import 'package:interview_survey_creator_simple/models/SurveyQuestionable.dart';
import 'package:interview_survey_creator_simple/pages/surveyQuestionsPage/widgets/foldersView/widgets/QuestionFile.dart';
import 'package:interview_survey_creator_simple/pages/surveyQuestionsPage/widgets/foldersView/widgets/QuestionFolder.dart';

class QuestionLists extends StatelessWidget {
  const QuestionLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      buildDefaultDragHandles: false,
      onReorder: (int oldIndex, int newIndex) {
        print('Reorder has occured');
      },
      itemBuilder: (context, index) {
        SurveyQuestionable question = SurveyQuestionBoolean(
          'Is this statement sdfnjsdfnj  ',
          1
        );
        return Builder(
          key: ValueKey(index),
          builder: (context) {
            if (index == 0) {
              return QuestionFile(
                question: question,
                isSelected: true
              );
            }
            if (index == 1) {
              return QuestionFolder(folder: SurveyFolder('name', [question]));
            }
            return QuestionFile(question: question);
          }
        );
      }
    );
  }
}
