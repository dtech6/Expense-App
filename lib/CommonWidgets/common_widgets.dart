import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../constants/font_family_constants.dart';

Widget buildMainHeading(String title) {
  return Text(title,
      style: TextStyle(
          color: ColorConstants.darkBlue,
          fontSize: 40,
          fontFamily: FontFamilyConstants.gtWalsheimProBold));
}

Widget buildSubHeading(String title) {
  return Text(title,
      style: TextStyle(
          color: ColorConstants.darkBlue,
          fontSize: 24,
          fontFamily: FontFamilyConstants.gtWalsheimProBold));
}

Widget buildButton(VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          color: ColorConstants.darkBlue,
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Text("Submit",
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: FontFamilyConstants.gtWalsheimProBold)),
    ),
  );
}
