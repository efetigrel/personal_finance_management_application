import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_finance_management_application/screens/home_screen.dart';
import 'package:personal_finance_management_application/service/auth_service.dart';
import 'package:personal_finance_management_application/utils/button_styles.dart';
import 'package:personal_finance_management_application/utils/colors.dart';
import 'package:personal_finance_management_application/widgets/sign_in_and_sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: appBody()),
    );
  }

  SingleChildScrollView appBody() {
    return SingleChildScrollView(
      child: Center(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                logo(),
                emailTextField(),
                sizedBox10(),
                passwordTextField(),
                sizedBox10(),
                forgotPassword(),
                sizedBox10(),
                signInButton(),
                sizedBox20(),
                line(),
                sizedBox20(),
                googleSignInButton(),
                sizedBox10(),
                appleSignInButton(),
                sizedBox20(),
                signUpTextAndButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.email),
        hintText: 'example@gmail.com',
        labelText: 'Email',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Complete the Information";
        } else {}
        return null;
      },
      onSaved: (value) {
        email = value!;
      },
      style: const TextStyle(color: whiteColor),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Password',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Complete the Information";
        } else {}
        return null;
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      style: const TextStyle(color: whiteColor),
    );
  }

  TextButton forgotPassword() {
    return TextButton(
      onPressed: () {},
      child: const Text('forgot password ?'),
    );
  }

  ElevatedButton signInButton() {
    return ElevatedButton(
      onPressed: signIn,
      style: CustomButtonStyles.elevatedButtonStyle,
      child: const Text(
        'Sign in',
        style: TextStyle(color: whiteColor),
      ),
    );
  }

  Row signUpTextAndButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account,"),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, "/signUp"),
          child: const Text(
            'Sign up',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void signIn() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      final result = await authService.signIn(email, password);
      if (result == "success") {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Hata"),
              content: Text(result!),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Geri Don"),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
