// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

class ScreenSizeService {

  static const double TabletBreakpointDown = 700;

  static const double MobileBreakpointDown = 500;

  static const double DrawerMaxWidth = 360;

  static const double DrawerMaxWidthTablet = 250;


  double getDrawerMaxWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > TabletBreakpointDown ? DrawerMaxWidth : DrawerMaxWidthTablet;
  }
}