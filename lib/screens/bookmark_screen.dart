import 'package:flutter/material.dart';
import '../widgets/app_bottom_nav.dart';
import 'article_screen.dart';
import 'explore_screen.dart';
import 'weather_screen.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  int selectedIndex = 2;

  final List<Map<String, String>> articles = [
    {
      'title': 'How to Setup Your\nWorkspace',
      'category': 'Interior',
      'image': 'assets/images/pic1.jpg',
    },
    {
      'title': 'Discovering Hidden Gems:\n8 Off-The-Beaten-Path...',
      'category': 'Travel',
      'image': 'assets/images/pic2.jpg',
    },
    {
      'title': 'Exploring the World\'s Best\nBeaches: Top 5 Picks',
      'category': 'Travel',
      'image': 'assets/images/pic3.jpg',
    },
    {
      'title': 'Travel Destinations That\nWon\'t Break the Bank',
      'category': 'Travel',
      'image': 'assets/images/pic4.jpg',
    },
    {
      'title': 'How Working Remotely\nWill Make You More Happy',
      'category': 'Business',
      'image': 'assets/images/pic5.jpg',
    },
    {
      'title': 'Destinations for Authentic\nLocal Experiences',
      'category': 'Business',
      'image': 'assets/images/pic6.jpg',
    },
    {
      'title': 'A Guide to Seasonal\nGardening',
      'category': 'Travel',
      'image': 'assets/images/pic7.jpg',
    },
  ];

 
  Future<void> _confirmDelete(int index) async {
    final article = articles[index];

    final cleanTitle = article['title']!.replaceAll('\n', ' ');

    final bool? shouldDelete = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.20),
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.white,
          elevation: 8,
          insetPadding: const EdgeInsets.symmetric(horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            width: 345,
            height: 257,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(13, 27, 13, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      'Sure You want to delete this item?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF292929),
                        height: 1.2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 34),

                  SizedBox(
                    height: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                              right: 8,
                              top: 5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cleanTitle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF292929),
                                    height: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  article['category']!,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF777777),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            article['image']!,
                            width: 97,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  Row(
                    children: [
                      SizedBox(
                        width: 137,
                        height: 49,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(dialogContext, true);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF315FD3),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'Yes, Delete',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      SizedBox(
                        width: 66,
                        height: 49,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(dialogContext, false);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF315FD3),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'No',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    if (shouldDelete == true) {
      setState(() {
        articles.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
           
            Container(
              width: double.infinity,
              height: 60,
              color: const Color(0xFFE9EEF9),
              alignment: Alignment.center,
              child: const Text(
                'Bookmark',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF222222),
                ),
              ),
            ),

            Expanded(
              child: articles.isEmpty
                  ? const Center(
                      child: Text(
                        'No articles available',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF777777),
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.only(
                        left: 22,
                        right: 28,
                        top: 20,
                        bottom: 20,
                      ),
                      itemCount: articles.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 30),
                      itemBuilder: (context, index) {
                        final article = articles[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticleScreen(
                                  articleId: index,
                                ),
                              ),
                            );
                          },
                          onLongPress: () => _confirmDelete(index),
                          behavior: HitTestBehavior.opaque,
                          child: SizedBox(
                            height: 69,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          article['title']!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            height: 1.15,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF292929),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          article['category']!,
                                          style: const TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF777777),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Image.asset(
                                    article['image']!,
                                    width: 96,
                                    height: 69,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: AppBottomNav(
        selectedIndex: selectedIndex,
        onItemTapped: (index) {
       
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ExploreScreen(),
              ),
            );
            return;
          }

         
          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const WeatherScreen(),
              ),
            );
            return;
          }

         
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}