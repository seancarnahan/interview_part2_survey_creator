import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';
import 'package:interview_part2_survey_creator/widgets/button/EnvGestureDetector.dart';

class ReorderQuestionDragHandle extends StatelessWidget {
  final int questionRank;
  const ReorderQuestionDragHandle({Key? key, required this.questionRank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EnvGestureDetector(
      onTap: () => {},
      child: ReorderableDragStartListener(
        index: questionRank,
        child: const Icon(
          Icons.drag_handle,
          size: 24,
          color: BrandedColors.black500,
        ),
      )
    );
  }
}