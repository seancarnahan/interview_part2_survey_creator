import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/models/SurveyQuestionable.dart';
import 'package:interview_survey_creator_simple/mock_old/editView/widgets/SurveyQuestionCreator.dart';
import 'package:interview_survey_creator_simple/mock_old/SurveyProvider.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/styles/BrandedTextStyle.dart';
import 'package:provider/provider.dart';


class CollapsedQuestion extends StatefulWidget {
  final SurveyQuestionable question;
  const CollapsedQuestion({Key? key, required this.question}) : super(key: key);

  @override
  State<CollapsedQuestion> createState() => _CollapsedQuestionState();
}

class _CollapsedQuestionState extends State<CollapsedQuestion> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<SurveyProvider>(
        builder: ((context, surveyProvider, child) {
          return Flexible(
            child: InkWell(
              onTap: () {
                setState(() {
                  isEditing = true;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.question.rank != 1)
                    const SizedBox(height: 24),
                  RichText(
                    text: TextSpan(
                      text: '${widget.question.rank.toString()}.',
                      style: BrandedTextStyle.b1Reg(BrandedColors.black500),
                      children: [
                        const WidgetSpan(
                          child: SizedBox(width: 8)
                        ),
                        TextSpan(
                          text: widget.question.title,
                          style: BrandedTextStyle.b3Label(BrandedColors.black500)
                        )
                      ]
                    )
                  ),
                  const SizedBox(height: 24),
                  const Divider(height: 1, color: BrandedColors.black500),
                  Visibility(
                    visible: isEditing,
                    child: SurveyQuestionCreator(
                      surveyProvider: surveyProvider,
                      question: widget.question,
                    )
                  )
                ],
              )
            )
          );
        })
      );
  }
}
