// import 'package:flutter/material.dart';
// import 'package:interview_part2_survey_creator/mock_old/SurveyProvider.dart';
// import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';
// import 'package:interview_part2_survey_creator/widgets/button/EnvGestureDetector.dart';

// class CreateQuestionButton extends StatelessWidget {
//   final SurveyProvider surveyProvider;
//   const CreateQuestionButton({Key? key, required this.surveyProvider}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return EnvGestureDetector(
//       child: const Icon(
//         Icons.add,
//         size: 32,
//         color: BrandedColors.black500,
//       ),
//       onTap: () {
//         surveyProvider.updateIsCreatingQuestion(true);
//       },
//     );
//   }
// }
