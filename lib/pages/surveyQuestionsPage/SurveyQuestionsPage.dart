import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/services/ScreenSizeService.dart';

import 'widgets/EnvDesktopScaffold.dart';
import 'widgets/EnvMobileScaffold.dart';

class SurveyQuestionsPage extends StatelessWidget {
  const SurveyQuestionsPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < ScreenSizeService.MobileBreakpointDown;
    if (isMobile) {
      return const EnvMobileScaffold();
    }
    return const EnvDesktopScaffold();
  }
}
