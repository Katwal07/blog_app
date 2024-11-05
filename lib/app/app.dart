import 'package:blog_app/common/res/size_configs.dart';
import 'package:blog_app/core/configs/routes/routes_name.dart';
import 'package:flutter/material.dart';

import '../core/configs/routes/routes.dart';
import '../core/configs/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        AppSizeConfigs().init(constraints);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          title: 'Blog Application',
          initialRoute: AppRoutesName.splashScreen,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
