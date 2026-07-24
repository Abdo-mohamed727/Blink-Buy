import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/features/app_section/view/bottom_navigation_bar.dart';
import 'package:blinkbuy/features/app_section/view_model/cubit/app_section_cubit.dart';
import 'package:blinkbuy/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.appSection:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AppSectionCubit(),
            child: const AppSectionScreen(),
          ),
        );
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => OnbordingScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
