import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';
import 'package:interview_part2_survey_creator/styles/BrandedTextStyle.dart';
import 'package:interview_part2_survey_creator/widgets/controls/models/EnvDropdownConfig.dart';

class EnvDropdownIcon extends StatelessWidget {
  final EnvDropdownConfig config;
  final IconData icon;
  final double size;
  const EnvDropdownIcon({
    Key? key,
    required this.config,
    required this.icon,
    this.size=32
  }) : super(key: key);

  List<DropdownMenuItem<dynamic>> _getMenuItems() {
    List<DropdownMenuItem<dynamic>> menuItems = [];
    for (dynamic menuItemText in config.items.keys.toList()) {
      menuItems.add(
        DropdownMenuItem(
          value: config.items[menuItemText]!,
          child: Text(
            menuItemText,
            style: BrandedTextStyle.b3Label(BrandedColors.black500)
          ),
        )
      );
    }
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<dynamic>> menuItems = _getMenuItems();
    // TODO: replace with PopupMenu instead https://api.flutter.dev/flutter/material/PopupMenuButton-class.html
    return DropdownButton(
      isDense: true,
      selectedItemBuilder: (context) => [const Text('                                 ')],
      underline: const SizedBox(height: 0, width: 0),
      icon: Icon(
        icon,
        color: BrandedColors.black500,
        size: size,
      ),
      dropdownColor: BrandedColors.white500,
      value: menuItems[0].value,
      onChanged: config.onChanged,
      items: menuItems,
    );
  }
}
