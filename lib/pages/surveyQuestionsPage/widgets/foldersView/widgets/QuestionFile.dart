import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/models/SurveyQuestionable.dart';
import 'package:interview_part2_survey_creator/providers/SurveyProvider.dart';
import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';
import 'package:interview_part2_survey_creator/styles/BrandedTextStyle.dart';
import 'package:interview_part2_survey_creator/widgets/controls/EnvDropdownIcon.dart';
import 'package:interview_part2_survey_creator/widgets/controls/models/EnvDropdownConfig.dart';

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
          onTap:() => SurveyProvider().updateSelectedQuestion(question),
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
                EnvDropdownIcon(
                  config: EnvDropdownConfig(
                    items: {
                      'Delete': QuestionActions.Delete,
                    },
                    onChanged: (itemType) {
                      if (itemType == QuestionActions.Delete) {
                        SurveyProvider().deleteQuestion(question);
                      }
                    },
                  ),
                  icon: Icons.more_vert,
                  size: 16,
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}
