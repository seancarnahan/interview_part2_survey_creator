import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/constants/DesktopContstraints.dart';
import 'package:interview_survey_creator_simple/pages/surveyQuestionsPage/widgets/foldersView/FoldersView.dart';
import 'package:interview_survey_creator_simple/pages/surveyQuestionsPage/widgets/questionBuilderView/QuestionBuilderView.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/widgets/button/EnvGestureDetector.dart';

class EnvMobileScaffold extends StatelessWidget {
  const EnvMobileScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: BrandedColors.secondary500,
        width: DrawerMaxWidth,
        child: FoldersView(),
      ),
      appBar: AppBar(
        toolbarHeight: 72,
        elevation: 0,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        backgroundColor: BrandedColors.white500,
        title: Row(
          children: [
            Builder(
              builder: (context) => EnvGestureDetector(
                child: const Icon(
                  Icons.drag_indicator,
                  color: BrandedColors.black500,
                  size: 24,
                ),
                onTap: () => Scaffold.of(context).openDrawer(),
              )
            ),
            const SizedBox(width: 8),
            const Image(image: AssetImage('assets/Enveritas.png'))
          ],
        )
      ),
      body: const QuestionBuilderView(),
    );
  }
}
