import 'package:blog_club/article.dart';
import 'package:blog_club/profile.dart';
import 'package:blog_club/search.dart';
import 'package:blog_club/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String defaultFontFamily = 'Avenir';

  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          subtitle1: TextStyle(
              fontFamily: defaultFontFamily,
              color: secondaryTextColor,
              fontWeight: FontWeight.w200,
              fontSize: 18),
          headline6: TextStyle(
              fontFamily: defaultFontFamily,
              fontWeight: FontWeight.bold,
              color: primaryTextColor),
          headline4: TextStyle(
              fontFamily: defaultFontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: primaryTextColor),
          bodyText2: TextStyle(
              fontFamily: defaultFontFamily,
              color: secondaryTextColor,
              fontSize: 12),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: 64,
            child: IndexedStack(
              index: currentIndex,
              children: const [
                HomeScreen(),
                ArticleScreen(),
                SearchScreen(),
                ProfileScreen(),
              ],
            ),
          ),
          BottomNavigation(currentIndex: currentIndex, onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          })
        ],
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {

  static const int homeIndex = 0;
  static const int articleIndex = 1;
  static const int searchIndex = 2;
  static const int profileIndex = 3;
  final int currentIndex;

  final Function(int index) onTap;

  const BottomNavigation({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade800,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomNavItem(
                        'assets/img/icons/Home.png', 'Home',
                      currentIndex == homeIndex ? Colors.blue : Colors.grey.shade700,
                      onTap: () {
                          onTap(0);
                      },
                    ),
                    BottomNavItem(
                        'assets/img/icons/Articles.png', 'Article',
                      currentIndex == articleIndex ? Colors.blue : Colors.grey.shade700,
                      onTap: () {
                        onTap(1);
                      },),
                    const SizedBox(
                      width: 16,
                    ),
                    BottomNavItem(
                        'assets/img/icons/Search.png', 'Search',
                      currentIndex == searchIndex ? Colors.blue : Colors.grey.shade700,
                      onTap: () {
                        onTap(2);
                      },),
                    BottomNavItem(
                        'assets/img/icons/Menu.png', 'Profile',
                      currentIndex == profileIndex ? Colors.blue : Colors.grey.shade700,
                      onTap: () {
                        onTap(3);
                      },),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 22),
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(64)),
                child: Center(
                    child: Icon(
                  CupertinoIcons.plus,
                  color: Colors.white.withOpacity(0.75),
                  size: 42,
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String imgPath;
  final String title;
  final Color color;
  final Function() onTap;

  const BottomNavItem(this.imgPath, this.title, this.color, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 32,
              height: 32,
              child: Image.asset(
                imgPath,
                color: color,
              )),
          Text(title, style: TextStyle(color: color),),
        ],
      ),
    );
  }
}
