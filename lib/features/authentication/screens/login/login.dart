import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prototype/common/styles/spacing_styles.dart';
import 'package:prototype/features/authentication/screens/signup/signup.dart';
import 'package:prototype/utils/constants/colors.dart';
import 'package:prototype/utils/constants/image_strings.dart';
import 'package:prototype/utils/constants/sizes.dart';
import 'package:prototype/utils/constants/text_strings.dart';
import 'package:prototype/utils/helpers/helper_functions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  bool obscurePassword = true; // Track whether the password is obscured or not

  void togglePassword() {
    setState(() {
      obscurePassword = !obscurePassword; // Toggle the password visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo | Titles and Subtitles
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(
                        dark ? TImages.lightAppLogo : TImages.darkAppLogo),
                  ),
                  Text(TTexts.loginTitle,
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: TSizes.sm),
                  Text(TTexts.loginSubTitle,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              // Form
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      // Username
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: TTexts.username,
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwInputFields),

                      // Password
                      TextFormField(
                        obscureText:
                            obscurePassword, // Use the state variable to obscure the password
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.password_check),
                          labelText: TTexts.password,
                          suffixIcon: IconButton(
                            onPressed:
                                togglePassword, // Toggle password visibility
                            icon: Icon(
                              obscurePassword ? Iconsax.eye_slash : Iconsax.eye,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwInputFields / 2),

                      // Remember Me and Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Remember Me
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value!;
                                  });
                                },
                              ),
                              const Text(TTexts.rememberMe),
                            ],
                          ),

                          // Forget Password
                          TextButton(
                            onPressed: () {},
                            child: const Text(TTexts.forgetPassword),
                          ),
                        ],
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      // Sign in Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(TTexts.signIn),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      // Create Account Button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () => Get.to(() => const SignupScreen()),
                          child: const Text(TTexts.createAccount),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: dark ? TColors.darkGrey : TColors.grey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text(
                    TTexts.orSignInWith.capitalize!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Flexible(
                    child: Divider(
                      color: dark ? TColors.darkGrey : TColors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems2),
              //Footer | Socials Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: TColors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: TSizes.iconMd,
                        height: TSizes.iconMd,
                        image: AssetImage(TImages.google),
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: TColors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: TSizes.iconMd,
                        height: TSizes.iconMd,
                        image: AssetImage(TImages.facebook),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
