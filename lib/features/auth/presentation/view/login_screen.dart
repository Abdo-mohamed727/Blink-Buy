import 'package:blinkbuy/core/comman/widgets/app_toast.dart';
import 'package:blinkbuy/core/comman/widgets/coustom_text_form_field.dart';
import 'package:blinkbuy/core/comman/widgets/custom_button.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/core/validators/app_validator.dart';

import 'package:blinkbuy/features/auth/presentation/view_model/cubit/login_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          AppToast.showToast(
            context: context,
            title: "Login",
            description: "Logging in...",
            type: ToastificationType.info,
          );
        }

        if (state is LoginSuccess) {
          AppToast.showToast(
            context: context,
            title: "Success",
            description: state.message,
            type: ToastificationType.success,
          );

          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.appSection,
            (route) => false,
          );
        }

        if (state is LoginError) {
          AppToast.showToast(
            context: context,
            title: "Error",
            description: state.messageError,
            type: ToastificationType.error,
          );
        }
      },

      child: Scaffold(
        backgroundColor: AppColors.offWhite,

        appBar: AppBar(
          forceMaterialTransparency: true,

          backgroundColor: AppColors.offWhite,

          elevation: 0,

          scrolledUnderElevation: 0,

          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.hello);
            },

            icon: const Icon(
              Icons.arrow_back,

              color: AppColors.defaultBorderColor,
            ),
          ),
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),

          child: Column(
            children: [
              SizedBox(height: 40.h),

              Center(
                child: Text(
                  "Sign In Here",

                  textAlign: TextAlign.center,

                  style: TextStyles.font25boldAppbar.copyWith(
                    color: AppColors.primaryColor,

                    fontSize: 35.sp,

                    fontWeight: FontWeight.w800,

                    letterSpacing: 1.2,

                    shadows: [
                      Shadow(
                        color: AppColors.primaryColor.withOpacity(0.2),

                        blurRadius: 8,

                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        bottomSheet: Container(
          padding: EdgeInsets.all(16.w),

          height: 420.h,

          decoration: BoxDecoration(
            color: AppColors.primaryColor,

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),

              topRight: Radius.circular(25.r),
            ),
          ),

          child: Form(
            key: _formKey,

            child: Column(
              children: [
                SizedBox(height: 20.h),

                CustomTextField(
                  fillColour: AppColors.white,

                  filled: true,

                  validator: AppValidator.validateEmail,

                  controller: emailController,

                  hintText: "Enter Your Email",

                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 20.h),

                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    final cubit = context.read<LoginCubit>();

                    return CustomTextField(
                      fillColour: AppColors.white,
                      filled: true,
                      validator: AppValidator.validatePassword,
                      controller: passwordController,
                      hintText: "Enter Your Password",
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: cubit.obscureText,
                      suffixIcon: IconButton(
                        icon: Icon(
                          cubit.obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,

                          color: AppColors.defaultBorderColor,
                        ),

                        onPressed: () {
                          cubit.changeObscureText();
                        },
                      ),
                    );
                  },
                ),

                SizedBox(height: 10.h),

                Align(
                  alignment: Alignment.centerRight,

                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget password?",
                      style: TextStyles.font14SemiBold.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                CustomButton(
                  borderColor: AppColors.primaryColor,
                  backgroundColor: AppColors.white,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<LoginCubit>().login(
                        emailController.text.trim(),

                        passwordController.text.trim(),
                      );
                    }
                  },

                  text: "Login",
                  width: double.infinity,
                  height: 52.h,
                  textAlign: TextAlign.center,
                  textColor: AppColors.primaryColor,
                ),

                const Spacer(),

                Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Text(
                      "Don't have an account? ",

                      style: TextStyles.font14Regular.copyWith(
                        color: AppColors.white,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signUp);
                      },

                      child: Text(
                        "Sign Up",

                        style: TextStyles.font14SemiBold.copyWith(
                          color: AppColors.charcoal,

                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
