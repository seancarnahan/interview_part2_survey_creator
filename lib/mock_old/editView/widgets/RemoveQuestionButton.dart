// import 'package:flutter/material.dart';
// import 'package:interview_part2_survey_creator/models/SurveyQuestionable.dart';
// import 'package:interview_part2_survey_creator/mock_old/SurveyProvider.dart';
// import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';
// import 'package:interview_part2_survey_creator/widgets/button/EnvGestureDetector.dart';

// class RemoveQuestionButton extends StatelessWidget {
//   final SurveyProvider surveyProvider;
//   final SurveyQuestionable question;
//   const RemoveQuestionButton({
//     Key? key,
//     required this.surveyProvider,
//     required this.question
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return EnvGestureDetector(
//       // onTap: () => surveyProvider.removeQuestionByRank(question.rank),
//       onTap: () => print('TODO: use index for removal instead'),
//       child: const Icon(
//         Icons.do_not_disturb_on,
//         size: 32,
//         color: BrandedColors.red500,
//       ),
//     );
//   }
// }
