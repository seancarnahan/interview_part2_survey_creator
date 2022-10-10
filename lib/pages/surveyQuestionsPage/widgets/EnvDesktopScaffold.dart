import 'package:flutter/material.dart';

import 'foldersView/FoldersView.dart';
import 'questionBuilderView/QuestionBuilderView.dart';

class EnvDesktopScaffold extends StatelessWidget {
  const EnvDesktopScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            FoldersView(),
            Flexible(
              fit: FlexFit.loose,
              child: SizedBox(
                child: QuestionBuilderView(),
              )
            )
          ],
        ),
      ),
    );
  }
}
