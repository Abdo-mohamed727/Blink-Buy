import 'package:blinkbuy/core/comman/widgets/app_toast.dart';
import 'package:blinkbuy/core/comman/widgets/coustom_text_form_field.dart';
import 'package:blinkbuy/core/comman/widgets/custom_button.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/core/validators/app_validator.dart';
import 'package:blinkbuy/features/auth/domain/entity/register_entity.dart';
import 'package:blinkbuy/features/auth/presentation/view_model/cubit/register_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          AppToast.showToast(
            context: context,
            title: "Success",
            description: state.message,
            type: ToastificationType.success,
          );

          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }

        if (state is RegisterError) {
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

              Text(
                "Create Account",

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
            ],
          ),
        ),

        bottomSheet: Container(
          height: 600.h,

          padding: EdgeInsets.all(16.w),

          decoration: BoxDecoration(
            color: AppColors.primaryColor,

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
          ),

          child: Form(
            key: _formKey,

            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h),

                  CustomTextField(
                    filled: true,
                    fillColour: AppColors.white,

                    controller: nameController,

                    hintText: "Enter Your Name",

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your name";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 15.h),

                  CustomTextField(
                    filled: true,
                    fillColour: AppColors.white,

                    controller: emailController,

                    hintText: "Enter Your Email",

                    keyboardType: TextInputType.emailAddress,

                    validator: AppValidator.validateEmail,
                  ),

                  SizedBox(height: 15.h),

                  CustomTextField(
                    filled: true,
                    fillColour: AppColors.white,

                    controller: phoneController,

                    hintText: "Enter Your Phone",

                    keyboardType: TextInputType.phone,
                  ),

                  SizedBox(height: 15.h),

                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      final cubit = context.read<RegisterCubit>();

                      return CustomTextField(
                        filled: true,
                        fillColour: AppColors.white,

                        controller: passwordController,

                        hintText: "Enter Your Password",

                        validator: AppValidator.validatePassword,

                        obscureText: cubit.obscureText,

                        suffixIcon: IconButton(
                          icon: Icon(
                            cubit.obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),

                          onPressed: () {
                            cubit.changeObscureText();
                          },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 15.h),

                  CustomTextField(
                    filled: true,
                    fillColour: AppColors.white,

                    controller: confirmPasswordController,

                    hintText: "Confirm Password",

                    obscureText: true,

                    validator: (value) {
                      if (value != passwordController.text) {
                        return "Password not match";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 25.h),

                  CustomButton(
                    text: "Sign Up",

                    width: double.infinity,

                    height: 52.h,

                    backgroundColor: AppColors.white,

                    textColor: AppColors.primaryColor,

                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final request = RegisterRequestEntity(
                          name: nameController.text.trim(),

                          email: emailController.text.trim(),

                          phone: phoneController.text.trim(),

                          password: passwordController.text.trim(),

                          confirmPassword: confirmPasswordController.text
                              .trim(),
                        );

                        context.read<RegisterCubit>().register(request);
                      }
                    },
                  ),

                  SizedBox(height: 20.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        "Already have account? ",
                        style: TextStyles.font14Regular.copyWith(
                          color: AppColors.white,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.login);
                        },

                        child: Text(
                          "Login",

                          style: TextStyles.font14SemiBold.copyWith(
                            color: AppColors.charcoal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
