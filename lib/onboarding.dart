import 'package:blog_club/auth.dart';
import 'package:blog_club/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'gen/assets.gen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  final PageController _pageController = PageController();
  final tips = AppDatabase.tips;
  static bool isLastTips = false;

  @override
  void initState() {
    _pageController.addListener(() {
      if(_pageController.page!.round() == tips.length - 1) {
        setState(() {
          isLastTips = true;
        });
      } else {
        setState(() {
          isLastTips = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Container(
                  child: Assets.img.background.onboarding.image(),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 320,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade700,
                        blurRadius: 24,
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 238,
                      child: PageView.builder(
                        physics: const BouncingScrollPhysics(),
                          controller: _pageController,
                          itemCount: tips.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(32, 48, 32, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tips[index].title,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    tips[index].text,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmoothPageIndicator(
                              effect: const ExpandingDotsEffect(dotHeight: 24, dotWidth: 24, activeDotColor: Colors.blue),
                              count: tips.length,
                              controller: _pageController,
                            ),
                            SizedBox(
                              height: 24,
                              child: ElevatedButton(
                                onPressed: () {
                                  if(isLastTips) {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AuthScreen()));
                                  } else {
                                    _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
                                  }
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                                child: Icon(
                                  isLastTips ? CupertinoIcons.check_mark : CupertinoIcons.arrow_right,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
