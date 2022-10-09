import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/models/SurveyQuestionable.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/styles/BrandedTextStyle.dart';
import 'package:interview_survey_creator_simple/widgets/button/EnvGestureDetector.dart';

class QuestionFile extends StatelessWidget {
  final SurveyQuestionable question;
  final bool isSelected;
  const QuestionFile({
    Key? key,
    required this.question,
    this.isSelected=false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        color: isSelected ? BrandedColors.secondary600 : BrandedColors.secondary500,
        elevation: 0,
        margin: EdgeInsets.zero,
        child: InkWell(
          splashColor: BrandedColors.gray300,
          onTap:() => print('TODO: set provider with new selected QuestionFile'),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.insert_drive_file,
                    size: 16,
                    color: BrandedColors.black500,
                  )
                ),
                Expanded(
                  child: Text(
                    question.title,
                    overflow: TextOverflow.ellipsis,
                    style: BrandedTextStyle.b3Label(BrandedColors.black500)
                  ),
                ),
                EnvGestureDetector(
                  onTap: () => print('TODO: open action menu'),
                  child: const Icon(
                    Icons.more_vert,
                    color: BrandedColors.black500,
                    size: 16,
                  )
                )
              ],
            ),
          )
        ),
      )
    );
  }
}
