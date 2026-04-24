import 'package:flights_app/core/colors/appcolors.dart';
import 'package:flights_app/core/images/imagespathes.dart';
import 'package:flights_app/core/texts/textstyle.dart';
import 'package:flights_app/core/widgets/appwidgets.dart';
import 'package:flights_app/features/home/pages/home_layout.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();


  bool isTermsAccepted = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create Account',
                        style: AppTextStyles.font30BoldBlack,
                      ),
                       SizedBox(height: 8),
                      Text(
                        'Join us and start exploring the world',
                        style: AppTextStyles.font16MediumGray,
                      ),
                       SizedBox(height: 32),
                      Text('Full Name', style: AppTextStyles.font14MediumBlack),
                       SizedBox(height: 8),
                      CustomTextField(
                        hint: 'John Doe',
                        prefixIconPath: ImagePaths.person,
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Full Name cannot be empty';
                          }
                          return null;
                        },
                      ),
                       SizedBox(height: 20),
                      Text('Email', style: AppTextStyles.font14MediumBlack),
                       SizedBox(height: 8),
                      CustomTextField(
                        hint: 'john@example.com',
                        prefixIconPath: ImagePaths.email,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) return 'Email cannot be empty';
                          if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                            return 'Enter a valid email format';
                          }
                          return null;
                        },
                      ),
                       SizedBox(height: 20),
                      Text('Password', style: AppTextStyles.font14MediumBlack),
                       SizedBox(height: 8),
                      CustomTextField(
                        hint: '••••••••',
                        prefixIconPath: ImagePaths.lock,
                        isPassword: true,
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) return 'Password cannot be empty';
                          if (value.length < 8) return 'Must be at least 8 characters';
                          return null;
                        },
                      ),
                       SizedBox(height: 20),
                      Text('Confirm Password', style: AppTextStyles.font14MediumBlack),
                       SizedBox(height: 8),
                      CustomTextField(
                        hint: '••••••••',
                        prefixIconPath: ImagePaths.reEnterLock,
                        isPassword: true,
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) return 'Please confirm your password';
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                       SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isTermsAccepted = !isTermsAccepted;
                              });
                            },
                            child: Icon(
                              isTermsAccepted ? Icons.check_circle : Icons.radio_button_unchecked,
                              color: isTermsAccepted ? AppColors.primaryBlue : Colors.grey.shade400,
                              size: 24,
                            ),
                          ),
                           SizedBox(width: 12),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.5),
                                children: [
                                  TextSpan(text: 'By signing up, you agree to our '),
                                  TextSpan(
                                    text: 'Terms of Service',
                                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                                    recognizer: TapGestureRecognizer()..onTap = () {},
                                  ),
                                   TextSpan(text: ' and '),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                                    recognizer: TapGestureRecognizer()..onTap = () {},
                                  ),
                                   TextSpan(text: '.'),
                                ],
                              ),
                            ),
                          ),
                        ],
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
                              if (!isTermsAccepted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please accept the Terms of Service and Privacy Policy.'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeLayout() ,
                                ),
                                    (route) => false,
                              );
                            }
                          },
                          child: Text(
                            'Sign Up',
                            style: AppTextStyles.font16MediumWhite,
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      Row(
                        children: [
                           Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'OR CONTINUE WITH',
                              style: AppTextStyles.font12MediumGray,
                            ),
                          ),
                           Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                        ],
                      ),
                       SizedBox(height: 24),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(ImagePaths.google, width: 24),
                                   SizedBox(width: 8),
                                  Text('Google', style: AppTextStyles.font14MediumBlack),
                                ],
                              ),
                            ),
                          ),
                           SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(ImagePaths.facebook, width: 24),
                                   SizedBox(width: 8),
                                  Text('Facebook', style: AppTextStyles.font14MediumBlack),
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
                          Text('Already have an account?', style: AppTextStyles.font14MediumGray),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Sign In', style: AppTextStyles.font14MediumBlue),
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
      ),
    );
  }
}