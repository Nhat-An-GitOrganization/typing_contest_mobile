import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:typing_contest_mobile/screen/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> signInWithGoogle() async {
    // Create an instance of the firebase auth and goolge signin
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    // Triger the authentication
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    // Create a new credentials
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Sign in the user with the credentials
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.16,
              ),
              Center(
                child: Text(
                  'FPLSP',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 82, 113, 255),
                    fontSize: size.height * 0.07,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.016,
              ),
              Center(
                child: Text(
                  'Typing Contest',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 82, 113, 255),
                    fontSize: size.height * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.16,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(255, 56, 182, 255),
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () async {
                          //implement google sign in func
                          await signInWithGoogle();
                          if (mounted) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomePage()),
                              (route) => false,
                            );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Image.asset(
                                'lib/images/logogg.png',
                                width: size.width * 0.12,
                                height: size.height * 0.08,
                              ),
                            ),
                            Text(
                              'Đăng nhập với Google',
                              style: TextStyle(
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.10,
              ),
              Image.asset(
                'lib/images/fpoly.png',
                width: size.height * 0.18,
                height: size.height * 0.10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
