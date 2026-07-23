 
import 'package:blinkbuy/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class CheckNetwork extends StatelessWidget {
  const CheckNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.networkImage),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
