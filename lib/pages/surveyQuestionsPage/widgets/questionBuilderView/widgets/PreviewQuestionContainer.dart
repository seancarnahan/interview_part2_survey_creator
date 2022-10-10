import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';

import 'PreviewQuestionTitle.dart';

class PreviewQuestionContainer extends StatelessWidget {
  final Widget content;
  final String title;
  final int rank;
  const PreviewQuestionContainer({
    Key? key,
    required this.content,
    required this.title,
    required this.rank
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PreviewQuestionTitle(
          title: title,
          rank: rank,
        ),
        const SizedBox(height: 16),
        content,
        const SizedBox(height: 24),
        const Divider(
          color: BrandedColors.primary500,
          thickness: 1
        )
      ],
    );
  }
}
