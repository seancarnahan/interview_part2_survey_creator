import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/services/ScreenSizeService.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            FoldersHeader(),
            QuestionLists(),
            SizedBox(height: 32),
            AddFolderOrFile()
          ],
        )
      ),
    );
  }
}
