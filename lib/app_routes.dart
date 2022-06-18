import 'package:flutter/material.dart';

import 'container/first_screen.dart';
import 'container/login_screen.dart';

Map<String, WidgetBuilder> appRoute = {
  '/': (context) => LoginScreen(),
  // '/login': (context) => LoginScreen(),
};
