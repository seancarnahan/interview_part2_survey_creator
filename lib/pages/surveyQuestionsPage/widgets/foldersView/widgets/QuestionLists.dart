import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/providers/SurveyProvider.dart';

class QuestionLists extends StatelessWidget {
  final SurveyProvider surveyProvider;
  const QuestionLists({Key? key, required this.surveyProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: surveyProvider.survey.items.length,
      buildDefaultDragHandles: false,
      onReorder: (int oldIndex, int newIndex) {
        print('Reorder has occured');
      },
      itemBuilder: (context, index) {
        return surveyProvider.survey.items[index].buildItem(1);
      }
    );
  }
}
