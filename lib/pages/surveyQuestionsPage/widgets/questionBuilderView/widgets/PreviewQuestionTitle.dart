import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';
import 'package:interview_part2_survey_creator/styles/BrandedTextStyle.dart';

class PreviewQuestionTitle extends StatelessWidget {
  final String title;
  const PreviewQuestionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: BrandedTextStyle.b3Label(BrandedColors.black500),
      )
    );
  }
}
