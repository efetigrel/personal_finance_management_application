import 'package:flutter/material.dart';
import 'package:personal_finance_management_application/utils/button_styles.dart';
import 'package:personal_finance_management_application/utils/colors.dart';

SizedBox sizedBox10() {
  return const SizedBox(height: 10);
}

SizedBox sizedBox20() {
  return const SizedBox(height: 20);
}

Widget logo() {
  return const Image(
    height: 250,
    image: AssetImage('lib/assets/images/logo_white.png'),
  );
}

Row line() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 1,
        child: Container(
          height: 0.5,
          color: greyColor,
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'OR',
          style: TextStyle(color: greyColor),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          height: 0.5,
          color: greyColor,
        ),
      ),
    ],
  );
}

Widget googleSignInButton() {
  return ElevatedButton.icon(
    onPressed: () {},
    style: CustomButtonStyles.googleAndAppleButtonStyle,
    icon: Image.asset(
      'lib/assets/images/google_icon.png',
      height: 24.0,
      width: 24.0,
    ),
    label: const Text(
      'Continue with Google',
      style: TextStyle(color: whiteColor),
    ),
  );
}

Widget appleSignInButton() {
  return ElevatedButton.icon(
    onPressed: () {},
    style: CustomButtonStyles.googleAndAppleButtonStyle,
    icon: Image.asset(
      'lib/assets/images/apple_icon.png',
      height: 24.0,
      width: 24.0,
    ),
    label: const Text(
      ' Continue with Apple',
      style: TextStyle(color: whiteColor),
    ),
  );
}
