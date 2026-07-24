import 'package:blinkbuy/core/animation/animate_do.dart';
import 'package:blinkbuy/core/comman/widgets/custom_button.dart';
import 'package:blinkbuy/core/constants/app_images.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

    Navigator.pushReplacementNamed(context, AppRoutes.appSection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                        AppImages.backIcon,
                        width: 21.w,
                        height: 21.h,
                        color: AppColors.charcoal,
                      ),
                    )
                  else
                    SizedBox(width: 48.w),

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
                    SizedBox(width: 48.w),
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
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CoustomFadeInDown(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Image.asset(
                            data.urlImage,
                            width: 343.w,
                            height: 315.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      AnimatedSmoothIndicator(
                        activeIndex: _currentIndex,
                        count: onboardingData.length,
                        effect: WormEffect(
                          activeDotColor: AppColors.charcoal,
                          dotColor: AppColors.lightGrey,
                          dotHeight: 10.h,
                          dotWidth: 10.w,
                        ),
                      ),

                      SizedBox(height: 40.h),

                      CoustomFadeInLeft(
                        child: Text(
                          data.title,
                          style: TextStyles.font24SemiBold,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      CoustomFadeInRight(
                        child: Text(
                          data.description,
                          textAlign: TextAlign.center,
                          style: TextStyles.font16Regular.copyWith(
                            color: AppColors.charcoal.withOpacity(0.6),
                          ),
                        ),
                      ),

                      SizedBox(height: 56.h),

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
