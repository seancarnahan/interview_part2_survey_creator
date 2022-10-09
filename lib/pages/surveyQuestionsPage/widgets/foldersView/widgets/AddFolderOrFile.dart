import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/widgets/button/EnvGestureDetector.dart';

class AddFolderOrFile extends StatelessWidget {
  const AddFolderOrFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        EnvGestureDetector(
          onTap: () => print('object'),
          child: const Icon(
            Icons.add,
            size: 24,
            color: BrandedColors.black500,
          )
        ),
        const SizedBox(width: 24),
      ],
    );
  }
}
