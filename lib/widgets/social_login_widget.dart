import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homei/core/utils/app_icons.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({
    super.key,
    required this.socialLoginFunctions,
  });

  final Map<String, Function()?> socialLoginFunctions;



  @override
  Widget build(BuildContext context) {
    Map<String, String> socialLoginIcons= {
      'facebook': AppIcons.facebook,
      'google': AppIcons.google,
      'apple': AppIcons.apple
    };
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: socialLoginFunctions['facebook'],
          child: Container(
            height: 60,
            width: 60,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Image.asset(
              socialLoginIcons['facebook']!,
            ),
          ),
        ),
        if (!Platform.isAndroid) const SizedBox(width: 20),
        if (!Platform.isAndroid)
          GestureDetector(
            onTap: socialLoginFunctions['apple'],
            child: Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Image.asset(
                socialLoginIcons['apple']!,
              ),
            ),
          ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: socialLoginFunctions['google'],
          child: Container(
            height: 60,
            width: 60,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Image.asset(
              socialLoginIcons['google']!,
            ),
          ),
        ),
      ],
    );
  }
}
