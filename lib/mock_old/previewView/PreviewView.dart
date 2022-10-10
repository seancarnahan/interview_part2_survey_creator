// import 'package:flutter/material.dart';
// import 'package:interview_part2_survey_creator/mock_old/SurveyProvider.dart';
// import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';
// import 'package:interview_part2_survey_creator/styles/BrandedTextStyle.dart';

// import '../../pages/surveyQuestionsPage/widgets/questionBuilderView/widgets/SurveyNoQuestions.dart';

// class PreviewView extends StatelessWidget {
//   final SurveyProvider surveyProvider;
//   const PreviewView({Key? key, required this.surveyProvider}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     if (surveyProvider.survey.questions.isEmpty) {
//       return const SurveyNoQuestions();
//     }
//     return Column(
//       children: [
//         Text('Preview', style: BrandedTextStyle.b1Reg(BrandedColors.primary500)),
//         const SizedBox(height: 24),
//         ListView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true, // Listview's height will based on Children's height rather than height of its parent
//           itemCount: surveyProvider.survey.questions.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 24),
//               child: surveyProvider.survey.questions[index].getPreview(),
//             );
//           }
//         ),
//         const SizedBox(height: 8),
//       ],
//     );
//   }
// }
