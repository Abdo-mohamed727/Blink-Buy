import 'package:blinkbuy/core/di/service_locator.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/features/app_section/view/bottom_navigation_bar.dart';
import 'package:blinkbuy/features/app_section/view_model/cubit/app_section_cubit.dart';
import 'package:blinkbuy/features/favourite/presentation/view_model/cubit/favorite_cubit.dart';
import 'package:blinkbuy/features/auth/presentation/screens/login_screen.dart';
import 'package:blinkbuy/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:blinkbuy/features/cart/presentation/view/screens/cart_screen.dart';
import 'package:blinkbuy/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:blinkbuy/features/home/presintation/view_model/get_categories/get_categories_cubit.dart';
import 'package:blinkbuy/features/home/presintation/view_model/products_cubit/get_products_cubit.dart';
import 'package:blinkbuy/features/auth/presentation/screens/hello_screen.dart';
import 'package:blinkbuy/features/onboarding/onboarding_screen.dart';
import 'package:blinkbuy/features/product_details_screen/presentation/view/screens/product_details_screen.dart';
import 'package:blinkbuy/features/products_%20by_%20category/presentation/view/screens/product_by_category_screen.dart';
import 'package:blinkbuy/features/products_%20by_%20category/presentation/view_model/product_by_category_cubit/product_by_category_cubit.dart';
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
                create: (_) =>
                    serviceLocator<GetProductsCubit>()..getProducts(),
              ),
              BlocProvider(
                create: (_) =>
                    serviceLocator<GetCategoriesCubit>()..getCategories(),
              ),
            ],
            child: const AppSectionScreen(),
          ),
        );

      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => OnbordingScreen());
      case AppRoutes.productByCategoryScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final slug = args['slug'] as String;
        final categoryName = args['category'] as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                serviceLocator<ProductByCategoryCubit>()
                  ..getProductsByCategory(slug, categoryName),
            child: const ProductByCategoryScreen(),
          ),
          settings: settings,
        );
      case AppRoutes.hello:
        return MaterialPageRoute(builder: (_) => HelloScreen());
      case AppRoutes.productDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const ProductDetailsScreen(),
          settings: settings,
        );

      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LogInScreen());

      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppRoutes.cartScreen:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
