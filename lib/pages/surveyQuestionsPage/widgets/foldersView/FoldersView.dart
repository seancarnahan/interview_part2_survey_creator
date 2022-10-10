import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/services/ScreenSizeService.dart';
import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';
import 'package:provider/provider.dart';

import '../../../../providers/SurveyProvider.dart';
import 'widgets/AddFolderOrFile.dart';
import 'widgets/FoldersHeader.dart';
import 'widgets/QuestionLists.dart';

class FoldersView extends StatelessWidget {
  const FoldersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double drawerMaxWidth = ScreenSizeService().getDrawerMaxWidth(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: drawerMaxWidth
      ),
      child: Container(
        color: BrandedColors.secondary500,
        child: Consumer<SurveyProvider>(
          builder: (context, surveyProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FoldersHeader(),
                QuestionLists(surveyProvider: surveyProvider),
                const SizedBox(height: 32),
                const AddFolderOrFile()
              ],
            );
          },
        )
      ),
    );
  }
}
