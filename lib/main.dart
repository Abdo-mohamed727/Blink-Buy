import 'package:blinkbuy/core/di/service_locator.dart';
import 'package:blinkbuy/core/route/app_router.dart';
import 'package:blinkbuy/core/comman/screens/check_network.dart';
import 'package:blinkbuy/core/comman/widgets/connectivity_controller.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await ConnectivityController.instance.init();
  final prefs = await SharedPreferences.getInstance();

  final isDone = prefs.getBool('isDone') ?? false;

  runApp(MyApp(isDone: isDone));
}

class MyApp extends StatelessWidget {
  final bool isDone;
  const MyApp({super.key, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return ValueListenableBuilder(
          valueListenable: ConnectivityController.instance.isConnected,
          builder: (_, value, _) {
            if (value) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.deepPurple,
                  ),
                ),
                builder: (context, widget) {
                  return Scaffold(
                    body: Builder(
                      builder: (context) {
                        return widget!;
                      },
                    ),
                  );
                },
                initialRoute: AppRoutes.onboarding,
                //! initialRoute: isDone
                //!     ? AppRoutes.appSection
                //!     : AppRoutes.onboarding,
                onGenerateRoute: AppRouter.generateRoute,
              );
            } else {
              return const MaterialApp(
                title: 'no network',
                home: CheckNetwork(),
              );
            }
          },
        );
      },
    );
  }
}
