import 'package:blinkbuy/core/comman/widgets/coustom_text_form_field.dart';
import 'package:blinkbuy/core/comman/widgets/custom_button.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/core/validators/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        backgroundColor: Color(0xffEBEBEB),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1F1F1F)),
        ),
        title: Text("Login", style: TextStyles.font25boldAppbar),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Text("Email", style: TextStyles.font18Regular),
              SizedBox(height: 5.h),
              CustomTextField(
                validator: AppValidator.validateEmail,
                controller: emailController,
                hintText: "Enter Your Email",
                keyboardType: TextInputType.emailAddress,
                onPressed: () {},
              ),
              SizedBox(height: 30.h),
              Text("Password", style: TextStyles.font18Regular),
              SizedBox(height: 5.h),
              CustomTextField(
                validator: AppValidator.validatePassword,
                controller: passwordController,
                hintText: "Enter Your Password",
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                suffixIcon: const Icon(Icons.visibility_off_outlined),
                onPressed: () {},
              ),
              SizedBox(height: 5.h),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    //! Navigator.pushNamed(context, AppRoutes.forgetPassword);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    "Forget password?",
                    style: TextStyle(
                      color: Color(0xff939393),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40.h),
              CustomButton(
                borderColor: Color(0xFFFF9900),
                backgroundColor: AppColors.primaryColor,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, AppRoutes.home);
                  }
                },

                text: "Login",
                width: double.infinity,
                height: 52.h,
                textAlign: TextAlign.center,
                textColor: Colors.white,
              ),
              SizedBox(height: 300.h),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signUp);
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
