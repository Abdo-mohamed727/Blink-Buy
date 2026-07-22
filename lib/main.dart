import 'package:blinkbuy/core/route/app_router.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/core/screens/check_network.dart';
import 'package:blinkbuy/core/widgets/connectivity_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  final isDone = prefs.getBool('isDone') ?? false;

  runApp(MyApp(isDone: isDone));
}

class MyApp extends StatelessWidget {
  final bool isDone;
  const MyApp({super.key, required this.isDone});

  // This widget is the root of your application.
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
                initialRoute: isDone ? AppRoutes.home : AppRoutes.onboarding,
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.deepPurple,
                  ),
                ),

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
