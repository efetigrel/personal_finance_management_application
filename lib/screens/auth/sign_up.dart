import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_finance_management_application/screens/auth/sign_in.dart';
import 'package:personal_finance_management_application/service/auth_service.dart';
import 'package:personal_finance_management_application/utils/button_styles.dart';
import 'package:personal_finance_management_application/utils/colors.dart';
import 'package:personal_finance_management_application/widgets/sign_in_and_sign_up.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String email, password, fullname;
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
                sizedBox20(),
                googleSignInButton(),
                sizedBox10(),
                appleSignInButton(),
                sizedBox20(),
                line(),
                fullNameTextField(),
                sizedBox10(),
                emailTextField(),
                sizedBox10(),
                passwordTextField(),
                sizedBox20(),
                signUpButton(),
                sizedBox10(),
                signInTextAndButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField fullNameTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'John Doe',
        labelText: 'Full Name',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Complete the Information";
        } else {}
        return null;
      },
      onSaved: (value) {
        fullname = value!;
      },
      style: const TextStyle(color: whiteColor),
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

  ElevatedButton signUpButton() {
    return ElevatedButton(
      onPressed: signUp,
      style: CustomButtonStyles.elevatedButtonStyle,
      child: const Text(
        'Sign Up',
        style: TextStyle(color: whiteColor),
      ),
    );
  }

  Row signInTextAndButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account,"),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, "/signIn"),
          child: const Text(
            'Sign in',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void signUp() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      final result = await authService.signUp(email, fullname, password);

      if (result == "success") {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const SignIn()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result ?? "An error occurred."),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in all required fields."),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
