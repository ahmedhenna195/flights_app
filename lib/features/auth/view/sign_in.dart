import 'package:flights_app/core/colors/appcolors.dart';
import 'package:flights_app/core/images/imagespathes.dart';
import 'package:flights_app/core/texts/textstyle.dart';
import 'package:flights_app/core/widgets/appwidgets.dart';
import 'package:flights_app/features/auth/view/signupscreen.dart';
import 'package:flights_app/features/auth/view_model/auth_cubit.dart';
import 'package:flights_app/features/auth/view_model/auth_state.dart';
import 'package:flights_app/features/home/pages/home_layout.dart';
import 'package:flights_app/features/layout/view/main_layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  final formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainLayoutScreen()),
              );
            }
            else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 33,
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(ImagePaths.logo),
                                SizedBox(width: 8),
                                SvgPicture.asset(ImagePaths.logoTitle),
                              ],
                            ),
                            SizedBox(height: 40),
                            Text(
                              'Welcome Back',
                              style: AppTextStyles.font30BoldBlack,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Sign in to continue booking your next adventure',
                              maxLines: 2,
                              style: AppTextStyles.font16MediumGray,
                            ),
                            SizedBox(height: 32),
                            Text(
                              'Email',
                              style: AppTextStyles.font14MediumBlack,
                            ),
                            SizedBox(height: 8),
                            CustomTextField(
                              hint: 'name@example.com',
                              prefixIconPath: ImagePaths.email,
                              controller: emailController,
                              iconWidth: 20,
                              iconHeight: 16,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Email cannot be empty';
                                }
                                if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return 'Enter a valid email format';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Password',
                                  style: AppTextStyles.font14MediumBlack,
                                ),
                                Text(
                                  'Forgot Password?',
                                  style: AppTextStyles.font12MediumBlue,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            CustomTextField(
                              hint: 'Enter your password',
                              prefixIconPath: ImagePaths.lock,
                              isPassword: true,
                              controller: passwordController,
                              iconWidth: 20,
                              iconHeight: 16,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Password cannot be empty';
                                }
                                if (value.length < 8) {
                                  return 'Password must be not less than 8 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 32),
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );

                                  }
                                },
                                child: state is AuthLoading
                                    ? CircularProgressIndicator(color: Colors.white)
                                    : Text(
                                  'Sign in',
                                  style: AppTextStyles.font16MediumWhite,
                                ),
                              ),
                            ),
                            SizedBox(height: 34),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(thickness: 1, color: Colors.grey),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    'OR CONTINUE WITH',
                                    style: AppTextStyles.font12MediumGray,
                                  ),
                                ),
                                Expanded(
                                  child: Divider(thickness: 1, color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(height: 32),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 42,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(color: Colors.grey.shade300),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(ImagePaths.google),
                                        SizedBox(width: 8),
                                        Text(
                                          'Google',
                                          style: AppTextStyles.font14MediumBlack,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Container(
                                    height: 42,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(color: Colors.grey.shade300),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(ImagePaths.facebook),
                                        SizedBox(width: 8),
                                        Text(
                                          'Facebook',
                                          style: AppTextStyles.font14MediumBlack,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don’t have an account?',
                                  style: AppTextStyles.font14MediumGray,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Signupscreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: AppTextStyles.font14MediumBlue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
      ),
    );
  }
}