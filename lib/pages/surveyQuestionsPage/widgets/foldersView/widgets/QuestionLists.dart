import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/providers/SurveyProvider.dart';

import 'NewFolder.dart';

// TODO -> turn root into its own folder
class QuestionLists extends StatelessWidget {
  final SurveyProvider surveyProvider;
  const QuestionLists({Key? key, required this.surveyProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReorderableListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: surveyProvider.survey.items.length,
          buildDefaultDragHandles: false,
          onReorder: (int oldIndex, int newIndex) {
            int newIndexOffset = newIndex > oldIndex ? 1 : 0;
            surveyProvider.reorderItems(
              oldIndex,
              newIndex - newIndexOffset
            );
          },
          itemBuilder: (context, index) {
            return Container(
              key: ValueKey(surveyProvider.survey.items[index]),
              child: ReorderableDragStartListener(
                index: index,
                child: surveyProvider.survey.items[index].buildItem(1)
              )
            );
          }
        ),
        if (surveyProvider.isAddingFolder)
          NewFolder(surveyProvider: surveyProvider)
      ],
    );
  }
}
