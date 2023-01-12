import 'package:flutter/material.dart';

import 'package:paulsen_planer/core/res/color.dart';
import 'package:paulsen_planer/core/routes/routes.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Paulsen Planer',
      debugShowCheckedModeBanner: false,
      theme: AppColors.getTheme,
      initialRoute: Routes.home,
      onGenerateRoute: RouterGenerator.generateRoutes,
    );
  }
}
