import 'package:blinkbuy/core/animation/animate_do.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/app_images.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  final PageController _pageController = PageController();
  final List<OnboardingData> onboardingData = dataOnboarding();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

 void _skipOnboarding() async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setBool('isDone', true);

  Navigator.pushReplacementNamed(context, AppRoutes.home);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentIndex == 1)
                    IconButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/back_arrow.svg',
                        width: 21,
                        height: 21,
                        color: AppColors.charcoal,
                      ),
                    )
                  else
                    const SizedBox(width: 48),
    
                  if (_currentIndex == 0)
                    TextButton(
                      onPressed: _skipOnboarding,
                      child: Text(
                        'Skip',
                        style: TextStyles.font14Regular.copyWith(
                          color: AppColors.charcoal,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 48),
                ],
              ),
            ),
          ),
    
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final data = onboardingData[index];
    
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CoustomFadeInDown(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            data.urlImage,
                            width: 343.w,
                            height: 315.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
    
                      SizedBox(height: 20),
    
                      AnimatedSmoothIndicator(
                        activeIndex: _currentIndex,
                        count: onboardingData.length,
                        effect: WormEffect(
                          activeDotColor: AppColors.charcoal,
                          dotColor: AppColors.lightGrey,
                          dotHeight: 10,
                          dotWidth: 10,
                        ),
                      ),
    
                      SizedBox(height: 40),
    
                      CoustomFadeInLeft(
                        child: Text(
                          data.title,
                          style: TextStyles.font24SemiBold,
                        ),
                      ),
    
                      SizedBox(height: 8),
    
                      CoustomFadeInRight(
                        child: Text(
                          data.description,
                          textAlign: TextAlign.center,
                          style: TextStyles.font16Regular.copyWith(
                            color: AppColors.charcoal.withOpacity(0.6),
                          ),
                        ),
                      ),
    
                      SizedBox(height: 56),
    
                      CoustomFadeInUp(
                        child: CustomButton(
                          onPressed: () {
                            if (_currentIndex < onboardingData.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              _skipOnboarding();
                            }
                          },
                          text: _currentIndex < onboardingData.length - 1
                              ? 'Next'
                              : 'Get Started',
                          textStyle: TextStyles.font18SemiBold.copyWith(
                            color: AppColors.white,
                          ),
                          width: 343.w,
                          height: 48.h,
                          backgroundColor: AppColors.primaryColor,
                          textColor: Colors.white,
                          lastRadius: 8,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String urlImage;
  final String title;
  final String description;

  OnboardingData({
    required this.urlImage,
    required this.title,
    required this.description,
  });
}

List<OnboardingData> dataOnboarding() {
  return [
    OnboardingData(
      urlImage: AppImages.onboarding1,
      title: 'Discover Trends',
      description: 'Now we are here to provide variety of the best fashion',
    ),
    OnboardingData(
      urlImage: AppImages.onboarding2,
      title: 'Latest out fit',
      description: 'Express your self through the art of the fashionism',
    ),
  ];
}
