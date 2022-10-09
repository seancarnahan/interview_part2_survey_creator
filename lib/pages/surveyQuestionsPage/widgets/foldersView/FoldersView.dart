import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/constants/DesktopContstraints.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';

class FoldersView extends StatelessWidget {
  const FoldersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maxWidth = screenWidth > TabletBreakpointDown ? DrawerMaxWidth : DrawerMaxWidthTablet;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth
      ),
      child: Container(
        color: BrandedColors.secondary500,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            ListTile(
              title: Text('Item 1'),
            ),
            ListTile(
              title: Text('Item 2'),
            ),
          ],
        ),
      ),
    );
  }
}
