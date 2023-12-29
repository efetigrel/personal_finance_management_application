import 'package:flutter/material.dart';
import 'package:personal_finance_management_application/utils/colors.dart';

class CustomButtonStyles {
  static final elevatedButtonStyle = ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll(primaryColor1),
    minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );

  static final googleAndAppleButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(blackColor),
    minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
    side: MaterialStateProperty.all(
      const BorderSide(
        color: primaryColor1,
        width: 1.5,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

class AssetsLiabilitiesBottomButtonsStyle {
  static ButtonStyle elevatedButtonStyle(Color buttonColor) {
    return ElevatedButton.styleFrom(
      backgroundColor: buttonColor,
      foregroundColor: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
