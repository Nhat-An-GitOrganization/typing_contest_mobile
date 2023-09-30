import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfor extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const UserInfor({Key? key});

  @override
  State<UserInfor> createState() => _UserInforState();
}

class _UserInforState extends State<UserInfor> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: BackButton(color: isDarkMode ? Colors.white : Colors.blue),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
              Text(
                'My Profile',
                style: TextStyle(
                  fontSize: size.height * 0.032,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: size.width * (130 / size.width),
                      height: size.height * (130 / size.height),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: size.width * (4 / size.width),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 10),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(user.photoURL!),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: size.height * (40 / size.height),
                        width: size.width * (40 / size.width),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: size.width * (4 / size.width),
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.blue,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.08),
              texfieldMethod('Full Name', size, user.displayName!, isDarkMode),
              texfieldMethod('E-mail', size, user.email!, isDarkMode),
            ],
          ),
        ),
      ),
    );
  }

  Widget texfieldMethod(
      String labeltext, Size size, String placeholder, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 3),
          labelText: labeltext,
          labelStyle: TextStyle(
            color: Colors.blue,
            fontSize: size.height * (20 / size.height),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: size.height * (14 / size.height),
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
