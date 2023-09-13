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
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 130,
              ),
              Center(
                child: Text(
                  'FPLSP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(
                            0.5), // Thay đổi màu đổ bóng thành màu đen mờ
                        offset: const Offset(
                            4, 4), // Điều chỉnh độ lệch x và y của đổ bóng
                        blurRadius: 8, // Điều chỉnh bán kính mờ của đổ bóng
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Typing Contest',
                  style: TextStyle(
                    color: Colors.white, // Thay đổi màu chữ thành màu cam
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(
                            0.5), // Thay đổi màu đổ bóng thành màu đen mờ
                        offset: const Offset(
                            4, 4), // Điều chỉnh độ lệch x và y của đổ bóng
                        blurRadius: 8, // Điều chỉnh bán kính mờ của đổ bóng
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            Colors.yellow,
                            Colors.orange,
                          ],
                        ),
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () async {
                          //implement google sign in func
                          await signInWithGoogle();
                          if (mounted) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const HomePage()));
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
                                width: 50,
                                height: 50,
                              ),
                            ),
                            const Text(
                              'Continue with Google',
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Image.asset(
                'lib/images/fpoly.png',
                width: 150,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
