import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/providers/SurveyProvider.dart';
import 'package:interview_part2_survey_creator/services/ScreenSizeService.dart';
import 'package:provider/provider.dart';

import 'widgets/EnvDesktopScaffold.dart';
import 'widgets/EnvMobileScaffold.dart';

class SurveyQuestionsPage extends StatelessWidget {
  const SurveyQuestionsPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < ScreenSizeService.MobileBreakpointDown;
    return ChangeNotifierProvider<SurveyProvider>(
      create: (context) => SurveyProvider(),
      builder: (context, child) {
        if (isMobile) {
          return const EnvMobileScaffold();
        }
        return const EnvDesktopScaffold();
      },
    );
  }
}
