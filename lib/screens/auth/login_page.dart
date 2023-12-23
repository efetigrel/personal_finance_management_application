import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_finance_management_application/utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

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
                Column(
                  children: [
                    sizedBox10(),
                    emailTextField(),
                    sizedBox10(),
                    passwordTextField(),
                    sizedBox10(),
                    forgotPassword(),
                    sizedBox10(),
                    loginButton(),
                    sizedBox20(),
                    line(),
                    sizedBox20(),
                    googleSignInButton(),
                    sizedBox10(),
                    appleSignInButton(),
                  ],
                ),
                sizedBox20(),
                signUpTextAndButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return const Image(
      height: 250,
      image: AssetImage('lib/assets/images/logo_white.png'),
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

  ElevatedButton loginButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(primaryColor1),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Köşe yuvarlatma
          ),
        ),
      ),
      child: const Text(
        'Login',
        style: TextStyle(color: whiteColor),
      ),
    );
  }

  Row line() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 0.5,
            color: greyColor,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'OR',
            style: TextStyle(color: greyColor),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 0.5,
            color: greyColor,
          ),
        ),
      ],
    );
  }

  Widget googleSignInButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(blackColor),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: primaryColor1,
            width: 1.5,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      icon: Image.asset(
        'lib/assets/images/google_icon.png',
        height: 24.0,
        width: 24.0,
      ),
      label: const Text(
        'Sign in with Google',
        style: TextStyle(color: whiteColor),
      ),
    );
  }

  Widget appleSignInButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(blackColor),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: primaryColor1,
            width: 1.5,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      icon: Image.asset(
        'lib/assets/images/apple_icon.png',
        height: 24.0,
        width: 24.0,
      ),
      label: const Text(
        ' Sign in with Apple',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Row signUpTextAndButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account,"),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Sign Up',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  SizedBox sizedBox10() {
    return const SizedBox(height: 10);
  }

  SizedBox sizedBox20() {
    return const SizedBox(height: 20);
  }
}
