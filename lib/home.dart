import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 24, 32, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hi, Jonathan!',
                        style: themeData.textTheme.subtitle1,
                      ),
                      Image.asset(
                        'assets/img/icons/notification.png',
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                  child: Text(
                    'Explore Today\'s',
                    style: themeData.textTheme.headline6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: const _StoryList()),
                ),
                _CategoryList(context),
                _PostList(context),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Latest News',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'More',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
        PostItem(context),
      ],
    );
  }
}

class PostItem extends StatelessWidget {
  PostItem(BuildContext context, {super.key});

  final posts = AppDatabase.posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      itemExtent: 140,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/img/posts/small/${posts[index].imageFileName}',
                  width: 128,
                  height: 128,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      posts[index].caption,
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      posts[index].title,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.hand_thumbsup,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(posts[index].likes),
                          const SizedBox(
                            width: 16,
                          ),
                          const Icon(
                            CupertinoIcons.clock,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(posts[index].time),
                          const SizedBox(
                            width: 48,
                          ),
                          Icon(
                            getBookmarkIcon(posts[index].isBookmarked),
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  IconData? getBookmarkIcon(bool isBookmarked) {
    if (isBookmarked) {
      return CupertinoIcons.bookmark;
    } else {
      return CupertinoIcons.bookmark_fill;
    }
  }
}

class _CategoryList extends StatelessWidget {
  _CategoryList(BuildContext context);

  final _categories = AppDatabase.categories;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: _categories.length,
      itemBuilder: (context, index, realIndex) {
        return _CategoryItem(index);
      },
      options: CarouselOptions(
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 3),
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        aspectRatio: 1.3,
        disableCenter: true,
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final int index;

  const _CategoryItem(this.index);

  @override
  Widget build(BuildContext context) {
    final category = AppDatabase.categories[index];
    return Stack(children: [
      Positioned(
        bottom: 48,
        top: 100,
        right: 72,
        left: 72,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade900,
                blurRadius: 64,
                blurStyle: BlurStyle.solid,
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 0, 16),
        child: Stack(
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [Colors.blue.shade900, Colors.transparent])),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              left: 32,
              child: Text(
                category.title,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: stories.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Stack(
              children: [
                stories[index].isViewed
                    ? getStoryImageViewed(themeData, stories, index)
                    : getStoryImageNormal(themeData, stories, index),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/img/icons/${stories[index].iconFileName}',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
            Text(
              stories[index].name,
              style: themeData.textTheme.bodyText2,
            ),
          ],
        );
      },
    );
  }

  Widget getStoryImageNormal(
      ThemeData themeData, List<StoryData> stories, int index) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
      width: 76,
      height: 76,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
          Color(0xff376AED),
          Color(0xff4980E2),
          Color(0xff9CECFB),
        ]),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
        decoration: BoxDecoration(
            color: themeData.colorScheme.background,
            borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/img/stories/${stories[index].imageFileName}',
          ),
        ),
      ),
    );
  }

  Widget getStoryImageViewed(
      ThemeData themeData, List<StoryData> stories, int index) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
      width: 76,
      height: 76,
      child: DottedBorder(
        padding: const EdgeInsets.all(0),
        strokeWidth: 2,
        borderType: BorderType.RRect,
        dashPattern: const [8, 3],
        color: themeData.textTheme.bodyText2!.color!,
        radius: const Radius.circular(24),
        child: Container(
          padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
          decoration: BoxDecoration(
              color: themeData.colorScheme.background,
              borderRadius: BorderRadius.circular(32)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/img/stories/${stories[index].imageFileName}',
            ),
          ),
        ),
      ),
    );
  }
}
