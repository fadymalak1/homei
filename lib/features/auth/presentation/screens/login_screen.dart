import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homei/core/localization/app_localizations.dart';
import 'package:homei/core/utils/app_images.dart';
import 'package:homei/core/utils/color_palette.dart';
import 'package:homei/core/utils/helpers.dart';
import 'package:homei/core/utils/logger.dart';
import 'package:homei/features/auth/presentation/widgets/layout_widget.dart';
import 'package:homei/widgets/custom_textfield.dart';
import 'package:homei/widgets/custom_button.dart';
import 'package:homei/widgets/social_login_widget.dart';
import '../../../../core/utils/app_icons.dart';
import '../controllers/auth_controller.dart';

class SignInScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<SignInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  void _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      showToast("Please_enter_email_and_password", context);
      return;
    }

    await ref.read(authControllerProvider.notifier).login(email, password);

    final state = ref.read(authControllerProvider);

    if (state is AsyncData<String>) {
      AppLogger.log("Login successful! Token: ${state.value}");
      showToast("Login_successful", context);
    } else if (state is AsyncError) {
      AppLogger.error("Login failed", state.error, state.stackTrace);
      showToast("Login_failed", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final translate = AppLocalizations.of(context).translate;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      // Ensures the layout adjusts for the keyboard
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Layout(
          widget: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  translate("Welcome_back!"),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  translate("please_enter_your_details"),
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  emailController: _emailController,
                  title: translate("Email_or_Phone"),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  emailController: _passwordController,
                  title: translate("Password"),
                  obscureText: !_isPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                Row(
                  children: [
                    CupertinoCheckbox(
                      value: _rememberMe,
                      checkColor: AppColors.lightText,
                      activeColor: AppColors.primary,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                    ),
                    Text(translate("Remember_me")),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.greyText,
                      ),
                      child: Text(translate("Forgot_password?")),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: authState is AsyncLoading ? null : _login,
                  widget: authState is AsyncLoading
                      ? const CircularProgressIndicator()
                      : Text(translate("Sign_in")),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: AppColors.primaryVariant,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(translate("or")),
                      SizedBox(width: 15),
                      const Expanded(
                        child: Divider(
                          color: AppColors.primaryVariant,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SocialLoginWidget(
                  socialLoginFunctions: {
                    "google": () async {
                      // await ref
                      //     .read(authControllerProvider.notifier)
                      //     .googleLogin();
                    },
                    "facebook": () async {
                      // await ref
                      //     .read(authControllerProvider.notifier)
                      //     .facebookLogin();
                    },
                    "apple": () async {
                      // await ref
                      //     .read(authControllerProvider.notifier)
                      //     .appleLogin();
                    }
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(translate("Don't_have_an_account?")),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      child: Text(translate("Sign_up")),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

