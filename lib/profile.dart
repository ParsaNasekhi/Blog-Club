import 'package:flutter/material.dart';

import 'gen/assets.gen.dart';
import 'home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Text('Profile'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz_rounded),
            onPressed: () {},
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(32, 0, 32, 64),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: themeData.colorScheme.surface,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: themeData.colorScheme.onBackground
                                  .withOpacity(0.1),
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Assets.img.stories.myImage
                                      .image(width: 84, height: 84),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Parsa Nasekhi',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16),
                                      ),
                                      Text(
                                        '@Parsa_N80',
                                        style: TextStyle(
                                            color: Colors.grey.shade700),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const Text(
                                        'Mobile Developer',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                            child: Text(
                              'About Me',
                              style: themeData.textTheme.headline6,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(32, 4, 32, 32),
                            child: Text(
                              'I develop mobile applications using Kotlin and Java languages for Android. Also, I use the Flutter framework as a cross-platform development solution.',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 32,
                      left: 96,
                      right: 96,
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 30,
                              color: themeData.colorScheme.onBackground
                                  .withOpacity(0.8)),
                        ]),
                      )),
                  Positioned(
                      bottom: 32,
                      left: 64,
                      right: 64,
                      child: Container(
                        height: 68,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff2151CD),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '52',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              themeData.colorScheme.onPrimary),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    const Text(
                                      'Post',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '250',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    'Following',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4.5K',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    'Followers',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'My Posts',
                              style: themeData.textTheme.headline6,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.grid.svg(),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.table.svg(),
                          ),
                        ],
                      ),
                    ),
                    PostItem(context),
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
