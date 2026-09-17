import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bookmark_screen.dart';

class ArticleScreen extends StatefulWidget {
  final int articleId;

  const ArticleScreen({
    super.key,
    required this.articleId,
  });

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  bool isBookmarked = false;

  String get bookmarkKey => 'article_bookmarked_${widget.articleId}';

  @override
  void initState() {
    super.initState();
    loadBookmark();
  }

  Future<void> loadBookmark() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getBool(bookmarkKey) ?? false;
    if (!mounted) return;
    setState(() {
      isBookmarked = saved;
    });
  }

  Future<void> toggleBookmark() async {
    setState(() {
      isBookmarked = !isBookmarked;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(bookmarkKey, isBookmarked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
       
            Stack(
              clipBehavior: Clip.none,
              children: [
             
                SizedBox(
                  width: double.infinity,
                  height: 280,
                  child: Image.asset(
                    'assets/images/people-collaborating-with-tech- (1) 1.png',
                    fit: BoxFit.cover,
                  ),
                ),

              
                Positioned(
                  top: 224,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 56,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF7F4F2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                    ),
                  ),
                ),

              
                Positioned(
                  top: 232,
                  left: 40,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookmarkScreen(),
                        ),
                      );
                    },
                    behavior: HitTestBehavior.opaque,
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.arrow_back,
                        size: 26,
                        color: Color(0xFF292727),
                      ),
                    ),
                  ),
                ),

            
                Positioned(
                  top: 232,
                  right: 40,
                  child: Row(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            toggleBookmark();
                          },
                          customBorder: const CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              transitionBuilder: (child, animation) =>
                                  ScaleTransition(
                                scale: animation,
                                child: child,
                              ),
                              child: Icon(
                                isBookmarked
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                key: ValueKey(isBookmarked),
                                size: 26,
                                color: isBookmarked
                                    ? Colors.black
                                    : const Color(0xFF292727),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/Vector.png',
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'See How the Forest is\nHelping Our World',
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF292727),
                            height: 1.18,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/images/Ellipse 1.png',
                                width: 22,
                                height: 22,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Harry Harper',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF777777),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              '•',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF999999),
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              'Apr 12, 2023',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF777777),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 27),
                        const Text(
                          '''Forests are one of the most important natural resources that our planet possesses. Not only do they provide us with a diverse range of products such as timber, medicine, and food, but they also play a vital role in mitigating climate change and maintaining the overall health of our planet's ecosystems. In this article, we will explore the ways in which forests are helping our world.''',
                          style: TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF292727),
                            height: 1.52,
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          '''One of the most important roles that forests play is in absorbing carbon dioxide from the atmosphere. Trees absorb carbon dioxide through photosynthesis and store it in their trunks, branches, and leaves. This carbon storage helps to reduce the amount of carbon dioxide in the atmosphere, which is a major contributor to climate change.''',
                          style: TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF292727),
                            height: 1.52,
                          ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          '''Forests also provide a home for a vast array of wildlife and plant species. They are one of the most biodiverse ecosystems on our planet, providing food and shelter for countless animals and insects.''',
                          style: TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF292727),
                            height: 1.52,
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}