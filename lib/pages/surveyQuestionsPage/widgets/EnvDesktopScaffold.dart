import 'package:flutter/material.dart';

import 'foldersView/FoldersView.dart';
import 'questionBuilderView/QuestionBuilderView.dart';

class EnvDesktopScaffold extends StatelessWidget {
  const EnvDesktopScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Flexible(
            child: FoldersView()
          ),
          Expanded(
            child: QuestionBuilderView(),
          )
        ],
      ),
    );
  }
}
