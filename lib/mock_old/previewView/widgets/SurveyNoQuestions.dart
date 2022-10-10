import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';
import 'package:interview_part2_survey_creator/styles/BrandedTextStyle.dart';

class SurveyNoQuestions extends StatelessWidget {
  const SurveyNoQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double halfHeightOfPage = MediaQuery.of(context).size.height / 2;
    return SizedBox(
      height: halfHeightOfPage,
      width: double.infinity,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.hourglass_empty,
              size: 48,
              color: BrandedColors.primary500
            ),
            const SizedBox(height: 24),
            Text(
              'This Survey has no Questions yet.',
              textAlign: TextAlign.center,
              style: BrandedTextStyle.b1Reg(BrandedColors.black500)
            )
          ],
        ),
      ),
    );
  }
}
