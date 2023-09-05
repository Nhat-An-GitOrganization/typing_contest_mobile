import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:typing_contest_mobile/component/contest/category_list.dart';
import 'package:typing_contest_mobile/component/contest/contest_card.dart';
import 'package:typing_contest_mobile/component/contest/contest_caroulsel.dart';
import 'package:typing_contest_mobile/component/profile_menu.dart';
import 'package:typing_contest_mobile/component/search_box.dart';
import 'package:typing_contest_mobile/models/contest.dart';
import 'package:typing_contest_mobile/screen/login_screen.dart';
import 'package:typing_contest_mobile/screen/user_infor_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;
  bool showProfile = false;
  bool showHomePage = true;
  bool showHistory = false;
  bool isDarkMode = false;
  ThemeData themeData = ThemeData.light();
  void toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
    if (isDarkMode) {
      themeData = ThemeData.dark();
    } else {
      themeData = ThemeData.light();
    }
  }

  Future<void> logout() async {
    final GoogleSignIn googleSign = GoogleSignIn();
    await googleSign.signOut();
  }

  int activeIndex = 0;
  final urlImages = [
    'https://images.unsplash.com/photo-1682685796852-aa311b46f50d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
    'https://plus.unsplash.com/premium_photo-1692049122940-9ed87ceee9a4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
    'https://plus.unsplash.com/premium_photo-1692673142063-e1184cb78c0e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
    'https://images.unsplash.com/photo-1692647452396-2295ea1df776?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1926&q=80'
  ];
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          color: const Color.fromARGB(255, 25, 145, 243),
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 200),
          onTap: (index) {
            setState(() {
              if (index == 2) {
                showProfile = true;
                showHistory = false;
                showHomePage = false;
              } else if (index == 0) {
                showHomePage = false;
                showProfile = false;
                showHistory = true;
              } else {
                showHomePage = true;
                showHistory = false;
                showProfile = false;
              }
            });
          },
          items: const [
            Icon(
              Icons.history_edu,
              color: Colors.white,
            ),
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (showProfile) ProFileMethod(user, context),
                if (showHistory) const Text('History'),
                if (showHomePage) ...[
                  buildAppbar(),
                  const SearchBox(),
                  const CategoryList(),
                  HomeMethod(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: const Text('Contest'),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('lib/svg/notification.svg'),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Center HomeMethod() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          const ContestCarousel(),
          const SizedBox(
            height: 40,
          ),
          for (var i = 0; i < contest.length; i++)
            ContestCard(
              itemIndex: i,
              ct: contest[i],
            ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ProFileMethod(User user, BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Profile',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                SizedBox(
                  height: 115,
                  width: 115,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(user.photoURL!),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 70),
                ProfileMenu(
                  icon: Icons.person_3,
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const UserInfor()));
                  },
                  title: 'My Profile',
                ),
                const SizedBox(height: 20),
                ProfileMenu(
                  icon: Icons.settings,
                  onPress: () {},
                  title: 'Settings',
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue.withOpacity(0.1)),
                    child: const Icon(
                      Icons.dark_mode,
                      color: Colors.blue,
                    ),
                  ),
                  title: const Text('Dark Mode'),
                  trailing: CupertinoSwitch(
                    value: isDarkMode,
                    onChanged: toggleDarkMode,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 15,
                ),
                ProfileMenu(
                  title: 'Logout',
                  icon: Icons.logout,
                  onPress: () async {
                    await logout();
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  },
                  endIcon: false,
                  textColor: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
