import 'package:blinkbuy/core/comman/widgets/coustom_text_form_field.dart';
import 'package:blinkbuy/core/comman/widgets/custom_button.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<LogInScreen> {
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
        title: Text(
          "Login",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xff1F1F1F),
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "Email",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 5),
            CustomTextField(
              controller: emailController,
              hintText: "Enter Your Email",
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 30),
            Text(
              "Password",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 5),
            CustomTextField(
              controller: passwordController,
              hintText: "Enter Your Password",
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              suffixIcon: const Icon(Icons.visibility_off_outlined),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigator.pushNamed(context, AppRoutes.forgetPassword);
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

            SizedBox(height: 40),
            CustomButton(
              borderColor: Color(0xFFFF9900),
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.home);
              },

              text: "Login",
              width: double.infinity,
              height: 52,
              textAlign: TextAlign.center,
              textColor: Colors.white,
            ),
            SizedBox(height: 300),
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
    );
  }
}
