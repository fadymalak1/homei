
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homei/core/localization/app_localizations.dart';
import 'package:homei/core/utils/color_palette.dart';
import 'package:homei/core/utils/logger.dart';
import 'package:homei/features/auth/presentation/widgets/layout_widget.dart';
import 'package:homei/widgets/custom_button.dart';
import 'package:homei/widgets/custom_textfield.dart';
import 'package:homei/widgets/social_login_widget.dart';
import '../controllers/auth_controller.dart';
import 'package:country_code_picker_plus/country_code_picker_plus.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  void _register() {
    if (_formKey.currentState!.validate()) {
      ref.read(authControllerProvider.notifier).register(
        _nameController.text,
        _emailController.text,
        _phoneController.text,
        _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    final translate = AppLocalizations
        .of(context)
        .translate;
    return Scaffold(
      body: Layout(widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Text(
                translate("Create_new_account"),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                translate("Get_your_dream_home_today"),
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                  emailController: _nameController, title: translate("Name")),
              const SizedBox(height: 10,),
              CustomTextField(emailController: _emailController,
                title: translate("Email"),
                keyboardType: TextInputType.emailAddress,),
              const SizedBox(height: 10,),

              CustomTextField(emailController: _phoneController,
                title: translate("Phone"),
                keyboardType: TextInputType.phone,
                prefixIcon:CountryCodePicker(
                  mode: CountryCodePickerMode.dropdown,
                  onChanged: (country) {
                    AppLogger.log("Country code: ${country.dialCode}");
                  },
                  flagDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  showFlagDialog: true,
                  showFlagMain: true,
                  enabled: false,
                  icon: const SizedBox.shrink(),
                  initialSelection: 'EG',

                  countryFilter: const [
                    "EG",
                  ],
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  // PhoneNumberFormatter(),
                ],),
              const SizedBox(height: 10),
              CustomTextField(emailController: _passwordController,
                title: translate("Password"),
                obscureText: !_passwordVisible,
                suffixIcon: IconButton(
                  icon: Icon(_passwordVisible ? Icons.visibility : Icons
                      .visibility_off),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),),
              const SizedBox(
                height: 10,),
              CustomTextField(emailController: _confirmPasswordController,
                title: translate("Confirm_Password"),
                obscureText: !_confirmPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(_confirmPasswordVisible ? Icons.visibility : Icons
                      .visibility_off),
                  onPressed: () {
                    setState(() {
                      _confirmPasswordVisible = !_confirmPasswordVisible;
                    });
                  },
                ),),

              const SizedBox(height: 25),
              CustomButton(onPressed: state is AsyncLoading ? null : _register,
                widget: state is AsyncLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(translate("Create_Account")),),

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
                    const SizedBox(width: 15),
                    Text(translate("or")),
                    const SizedBox(width: 15),
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
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(translate("Already_a_member?")),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(translate("Sign_in")),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),),
    );
  }
}
