import 'package:blinkbuy/core/route/app_router.dart';
import 'package:blinkbuy/core/comman/screens/check_network.dart';
import 'package:blinkbuy/core/comman/widgets/connectivity_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
