import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/presentation/utils/routes.dart';
import 'core/presentation/design/tokens/theme.dart' as t;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'order360',
          themeMode: ThemeMode.light,
          theme: t.Theme().theme,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
          supportedLocales: const [
            Locale('es'),
            Locale('en'),
          ],
        );
      },
    );
  }
}
