import 'package:blinkbuy/core/comman/widgets/coustom_text_form_field.dart';
import 'package:blinkbuy/core/comman/widgets/custom_button.dart';
import 'package:blinkbuy/core/route/app_routes.dart';
import 'package:blinkbuy/core/theme/app_colors.dart';
import 'package:blinkbuy/core/theme/styels.dart';
import 'package:blinkbuy/core/utils/app_dialog.dart';
import 'package:blinkbuy/core/utils/app_toast.dart';
import 'package:blinkbuy/core/validators/app_validator.dart';
import 'package:blinkbuy/features/auth/domain/entities/register_request_entity.dart';
import 'package:blinkbuy/features/auth/presentation/view_model/register/register_cubit.dart';
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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
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
        title: Text("Sign Up", style: TextStyles.font25boldAppbar),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterLoading) {
                AppDialogs.showLoadingDialog(context);
                return;
              }

              Navigator.of(context, rootNavigator: true).pop();

              if (state is RegisterError) {
                AppToast.showToast(
                  context: context,
                  title: "Error !",
                  description: state.message,
                  type: ToastificationType.error,
                );
              }

              if (state is RegisterSuccess) {
                ///navigate to login
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Text("Full Name", style: TextStyles.font18Regular),
                SizedBox(height: 5.h),
                //!
                CustomTextField(
                  validator: AppValidator.validateName,
                  controller: nameController,
                  hintText: "Enter Your Full Name",
                  keyboardType: TextInputType.name,
                  onPressed: () {},
                ),

                SizedBox(height: 20.h),
                Text("Email", style: TextStyles.font18Regular),
                SizedBox(height: 5.h),
                //!
                CustomTextField(
                  validator: AppValidator.validateEmail,
                  controller: emailController,
                  hintText: "Enter Your Email",
                  keyboardType: TextInputType.emailAddress,
                  onPressed: () {},
                ),

                SizedBox(height: 20.h),
                Text("Phone Number", style: TextStyles.font18Regular),
                SizedBox(height: 5.h),
                //!
                CustomTextField(
                  validator: AppValidator.validatePhone,
                  controller: phoneNumberController,
                  hintText: "Enter Your Phone Number",
                  keyboardType: TextInputType.phone,
                  onPressed: () {},
                ),

                SizedBox(height: 20.h),
                Text("Password", style: TextStyles.font18Regular),
                SizedBox(height: 5.h),
                //!
                CustomTextField(
                  obscureText: isPasswordHidden,
                  validator: AppValidator.validatePassword,
                  controller: passwordController,
                  hintText: "Enter Your Password",
                  keyboardType: TextInputType.visiblePassword,

                  suffixIcon: Icon(
                    isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordHidden = !isPasswordHidden;
                    });
                  },
                ),

                SizedBox(height: 20.h),
                Text("Confirm Password", style: TextStyles.font18Regular),
                SizedBox(height: 5.h),

                //!
                CustomTextField(
                  validator: (value) => AppValidator.validateConfirmPassword(
                    value,
                    passwordController.text,
                  ),
                  controller: confirmPasswordController,
                  hintText: "Confirm Your Password",
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isConfirmPasswordHidden,
                  suffixIcon: Icon(
                    isConfirmPasswordHidden
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordHidden = !isConfirmPasswordHidden;
                    });
                  },
                ),
                SizedBox(height: 20.h),

                //! sign up button
                CustomButton(
                  borderColor: Color(0xFFFF9900),
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var request = RegisterRequestEntity(
                        name: nameController.text,
                        phone: phoneNumberController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        confirmPassword: confirmPasswordController.text,
                      );
                      context.read<RegisterCubit>().intent(
                        RegisterIntentRegister(request),
                      );
                    }
                  },
                  text: "Sign up",
                  width: double.infinity,
                  height: 52.h,
                  textAlign: TextAlign.center,
                  textColor: Colors.white,
                ),

                SizedBox(height: 200.h),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Already have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.login);
                        },
                        child: const Text(
                          "Login",
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
      ),
    );
  }
}
