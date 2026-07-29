import 'package:blinkbuy/core/constants/api_keys.dart';
import 'package:blinkbuy/core/di/service_locator.dart';
import 'package:blinkbuy/core/route/app_router.dart';
import 'package:blinkbuy/core/comman/screens/check_network.dart';
import 'package:blinkbuy/core/comman/widgets/connectivity_controller.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/core/storage_helper/secure_storage_helper.dart';
import 'package:blinkbuy/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:blinkbuy/features/favourite/presentation/view_model/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  await ConnectivityController.instance.init();

  final prefs = await SharedPreferences.getInstance();
  final String? token = await serviceLocator<SecureStorageHelper>().getSecure(
    key: AppKeys.tokenKey,
  );

  final isDone = prefs.getBool('isDone') ?? false;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<CartCubit>()..getCart()),
        BlocProvider(
          create: (_) => serviceLocator<FavoriteCubit>()..getFavourites(),
        ),
      ],

      child: MyApp(isDone: isDone, token: token),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isDone;
  final String? token;
  const MyApp({super.key, required this.isDone, this.token});

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
                
                initialRoute: !isDone
                    ? AppRoutes.onboarding
                    : token != null
                    ? AppRoutes.appSection
                    : AppRoutes.login,
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
