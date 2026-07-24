import 'package:blinkbuy/core/di/service_locator.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/features/app_section/view/bottom_navigation_bar.dart';
import 'package:blinkbuy/features/app_section/view_model/cubit/app_section_cubit.dart';
import 'package:blinkbuy/features/home/presintation/view_model/get_categories/get_categories_cubit.dart';
import 'package:blinkbuy/features/home/presintation/view_model/products_cubit/get_products_cubit.dart';
import 'package:blinkbuy/features/auth/presentation/screens/hello_screen.dart';
import 'package:blinkbuy/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.appSection:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => AppSectionCubit()),
              BlocProvider(
                create: (context) =>
                    serviceLocator<GetProductsCubit>()..getProducts(),
              ),
              BlocProvider(
                create: (context) =>
                    serviceLocator<GetCategoriesCubit>()..getCategories(),
              ),
            ],
            child: const AppSectionScreen(),
          ),
        );
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => OnbordingScreen());
      case AppRoutes.hello:
        return MaterialPageRoute(builder: (_) => HelloScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
