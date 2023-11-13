import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:typing_contest_mobile/component/classPage/class.dart';
import 'package:typing_contest_mobile/component/contest/contest_card.dart';
import 'package:typing_contest_mobile/component/contest/contest_caroulsel.dart';
import 'package:typing_contest_mobile/component/history/contest_entered.dart';
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

  @override
  void initState() {
    super.initState();
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
    Size size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final user = FirebaseAuth.instance.currentUser!;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          color: const Color.fromARGB(255, 26, 115, 232),
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 300),
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
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (showProfile) ProFileMethod(user, size, context),
                  if (showHistory) ...[
                    buildAppbar("Lớp học"),
                    ClassMethod(size, context),
                  ],
                  if (showHomePage) ...[
                    buildAppbar("Cuộc thi"),
                    const SearchBox(),
                    HomeMethod(size),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppbar(String title) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 26, 115, 232),
      title: Text(title),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          //icon: SvgPicture.asset('lib/svg/notification.svg'),
          icon: const Icon(
            Icons.notifications,
          ),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget ClassMethod(Size size, BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.01,
        ),
        for (var i = 0; i < contest.length; i++)
          Column(
            children: [
              Class(
                itemIndex: i,
                ct: contest[i],
              ),
            ],
          ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Center HomeMethod(Size size) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.04,
          ),
          const ContestCarousel(),
          SizedBox(
            height: size.height * 0.065,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Text(
                'Cuộc thi',
                style: TextStyle(
                    fontSize: size.height * 0.025, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          for (var i = 0; i < contest.length; i++)
            Column(
              children: [
                ContestCard(
                  itemIndex: i,
                  ct: contest[i],
                ),
              ],
            ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ProFileMethod(User user, Size size, BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.035),
            Text(
              'Thông tin cá nhân',
              style: TextStyle(fontSize: size.height * 0.029),
            ),
            SizedBox(height: size.height * 0.05),
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.125,
                  width: size.width * 0.27,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(user.photoURL!),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.09),
                ProfileMenu(
                  icon: Icons.person_3,
                  onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const UserInfor()));
                  },
                  title: 'Thông tin cá nhân',
                ),
                SizedBox(height: size.height * 0.02),
                ProfileMenu(
                  icon: Icons.timer,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ContestEntered()));
                  },
                  title: 'Lịch Sử',
                ),
                SizedBox(height: size.height * 0.02),
                ListTile(
                  leading: Container(
                    width: size.width * 0.1,
                    height: size.height * 0.046,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(255, 26, 115, 232)
                          .withOpacity(0.1),
                    ),
                    child: const Icon(
                      Icons.dark_mode,
                      color: Color.fromARGB(255, 26, 115, 232),
                    ),
                  ),
                  title: Text(
                    'Chế độ tối',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.017),
                  ),
                  trailing: Consumer<ThemeProvider>(
                    builder: (context, themeProvider, _) => Switch(
                      inactiveTrackColor:
                          const Color.fromARGB(255, 216, 237, 255),
                      inactiveThumbColor:
                          const Color.fromARGB(255, 26, 115, 232)
                              .withOpacity(0.7),
                      activeColor: const Color.fromARGB(255, 26, 115, 232),
                      value: themeProvider.isDarkMode,
                      onChanged: (value) {
                        themeProvider.toggleDarkMode();
                      },
                    ),
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 228, 242, 254),
                ),
                SizedBox(
                  height: size.height * 0.018,
                ),
                ProfileMenu(
                  title: 'Đăng xuất',
                  icon: Icons.logout,
                  onPress: () async {
                    await logout();
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginPage(),
                      ),
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

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
