import 'package:blog_club/home.dart';
import 'package:flutter/material.dart';

import 'gen/assets.gen.dart';
import 'main.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: Assets.img.icons.logo.svg(width: 100),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32),
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isLoginMode = true;
                              });
                            },
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                  color: isLoginMode
                                      ? Colors.white
                                      : Colors.white70),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isLoginMode = false;
                              });
                            },
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                  color: isLoginMode
                                      ? Colors.white70
                                      : Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    isLoginMode ? const SignIn() : const SignUp(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(32, 48, 32, 0),
                child: Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 2, 32, 0),
                child: Text('Please enter your information',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    floatingLabelStyle: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8, 32, 0),
                child: TextField(
                  obscureText: isPasswordHidden,
                  autocorrect: false,
                  decoration: InputDecoration(
                    label: const Text('Password'),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    floatingLabelStyle: const TextStyle(color: Colors.blue),
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },
                          child: Text(
                            isPasswordHidden ? 'show' : 'hide',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const MainScreen())
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 24, 32, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: const Text(
                    'OR LOGIN WITH:',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.img.icons.google.image(
                      width: 36,
                      height: 36,
                    ),
                    const SizedBox(width: 32),
                    Assets.img.icons.facebook.image(
                      width: 36,
                      height: 36,
                    ),
                    const SizedBox(width: 32),
                    Assets.img.icons.twitter.image(
                      width: 36,
                      height: 36,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(32, 48, 32, 0),
                child: Text(
                  'Welcome to Blog Club',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 2, 32, 0),
                child: Text('Please enter your information',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    floatingLabelStyle: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    floatingLabelStyle: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8, 32, 0),
                child: TextField(
                  obscureText: isPasswordHidden,
                  autocorrect: false,
                  decoration: InputDecoration(
                    label: const Text('Password'),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    floatingLabelStyle: const TextStyle(color: Colors.blue),
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },
                          child: Text(
                            isPasswordHidden ? 'show' : 'hide',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const MainScreen())
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text('Sign Up'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 24, 32, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: const Text(
                    'OR SIGN UP WITH:',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.img.icons.google.image(
                      width: 36,
                      height: 36,
                    ),
                    const SizedBox(width: 32),
                    Assets.img.icons.facebook.image(
                      width: 36,
                      height: 36,
                    ),
                    const SizedBox(width: 32),
                    Assets.img.icons.twitter.image(
                      width: 36,
                      height: 36,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
