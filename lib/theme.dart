import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    hintColor: Colors.green,
    fontFamily: 'Roboto', // Örneğin, 'Roboto' fontunu kullanabilirsiniz
    // Diğer temel stil özelliklerini burada tanımlayabilirsiniz
  );

  // Eğer koyu tema kullanmak istiyorsanız:
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
    hintColor: Colors.green,
    // Diğer temel stil özelliklerini burada tanımlayabilirsiniz
  );
}
