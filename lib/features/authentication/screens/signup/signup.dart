import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prototype/utils/constants/colors.dart';
import 'package:prototype/utils/constants/image_strings.dart';
import 'package:prototype/utils/constants/sizes.dart';
import 'package:prototype/utils/constants/text_strings.dart';
import 'package:prototype/utils/helpers/helper_functions.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  SignupScreenState createState() => SignupScreenState(); // Updates
}

class SignupScreenState extends State<SignupScreen> {
  bool isChecked = false;
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
      appBar: AppBar(
        iconTheme: IconThemeData(color: dark ? Colors.white : TColors.dark),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Form
              Form(
                child: Column(
                  children: [
                    // First and Last Name
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                              labelText: TTexts.firstName,
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                              labelText: TTexts.lastName,
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    // Username
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: TTexts.username,
                        prefixIcon: Icon(Iconsax.user_edit),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    // Email
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: TTexts.email,
                        prefixIcon: Icon(Iconsax.direct),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    // Phone Number
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                      ],
                      decoration: const InputDecoration(
                        labelText: TTexts.phoneNo,
                        prefixIcon: Icon(Iconsax.call),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    // Password
                    TextFormField(
                      obscureText:
                          obscurePassword, // Use the state variable to obscure the password
                      decoration: InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed:
                              togglePassword, // Toggle password visibility
                          icon: Icon(
                            obscurePassword ? Iconsax.eye_slash : Iconsax.eye,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // TAC Checkbox
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                // Update the state of isChecked when checkbox is clicked
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        // Wrap the Text.rich inside a Flexible or Expanded widget
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '${TTexts.iAgreeTo} ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: TTexts.privacyPolicy,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? TColors.white
                                            : TColors.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? TColors.white
                                            : TColors.primary,
                                      ),
                                ),
                                TextSpan(
                                  text: ' ${TTexts.and} ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: TTexts.termsOfUse,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? TColors.white
                                            : TColors.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? TColors.white
                                            : TColors.primary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Sign up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(TTexts.createAccount),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

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
              const SizedBox(height: TSizes.spaceBtwItems),

              // Footer | Socials Buttons
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
