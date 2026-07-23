// import 'package:blinkbuy/core/route/app_router.dart';
// import 'package:blinkbuy/core/route/app_routes.dart';
// import 'package:blinkbuy/core/comman/screens/check_network.dart';
// import 'package:blinkbuy/core/comman/widgets/connectivity_controller.dart';
// import 'package:blinkbuy/core/theme/app_theme.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: ConnectivityController.instance.isConnected,
//       builder: (_, value, _) {
//         if (value) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Flutter Demo',
//             theme: ThemeData(
//               colorScheme: .fromSeed(seedColor: Colors.deepPurple),
//             ),
//             initialRoute: AppRoutes.home,
//             onGenerateRoute: AppRouter.generateRoute,
//           );
//         } else {
//           return MaterialApp(
//             title: 'no network',
//             home: const CheckNetwork(),
//             theme: AppTheme.lightTheme,

//             initialRoute: AppRoutes.splash,
//           );
//         }
//       },
//     );
//   }
// }
import 'package:blinkbuy/features/auth/presentation/screens/hello_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HelloScreen());
  }
}
