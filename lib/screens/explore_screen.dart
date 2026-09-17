import 'package:flutter/material.dart';
import '../widgets/app_bottom_nav.dart';
import 'bookmark_screen.dart';
import 'weather_screen.dart';
import 'search_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int selectedIndex = 1;


  final TextEditingController _searchController =
      TextEditingController();

  bool _isSearching = false;


  final List<Map<String, String>> _allArticles = [
    {
      'title':
          'Experience the Serenity of Japan\'s Traditional...',
      'author': 'Matthew Berge',
      'date': 'Apr 17, 2023',
      'image': 'assets/images/1.jpg',
      'category': 'Travel',
    },
    {
      'title':
          'Experience vs. Education: What Matters More in...',
      'author': 'Robin Wilkinson',
      'date': 'Apr 20, 2023',
      'image': 'assets/images/2.jpg',
      'category': 'Technology',
    },
    {
      'title':
          'Harnessing the Power of Experience: How to Use...',
      'author': 'Phillip Paucek',
      'date': 'Apr 29, 2023',
      'image': 'assets/images/3.jpg',
      'category': 'Travel',
    },
    {
      'title':
          'The Role of Experience in Developing Emotional...',
      'author': 'Gilberto Jacobson',
      'date': 'May 2, 2023',
      'image': 'assets/images/4.jpg',
      'category': 'Technology',
    },
    {
      'title':
          'From Failure to Success: How Experience Can Hel...',
      'author': 'Faith Sitham',
      'date': 'May 6, 2023',
      'image': 'assets/images/5.jpg',
      'category': 'Travel',
    },
    {
      'title': 'The Benefits of Multidisciplinary...',
      'author': 'Sophie Larkin',
      'date': 'May 10, 2023',
      'image': 'assets/images/6.jpg',
      'category': 'Technology',
    },
    {
      'title':
          'Experience and Creativity: Exploring the Connection...',
      'author': 'Glenn O\'Conner',
      'date': 'May 13, 2023',
      'image': 'assets/images/7.jpg',
      'category': 'Technology',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

 
  void _openSearchResults(String value) {
    final query = value.trim();

    if (query.isEmpty) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(
          query: query,
          articles: _allArticles,
        ),
      ),
    );
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
        
            Container(
              height: 55,
              width: double.infinity,
              color: const Color(0xffe9edf9),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Row(
                children: [
              
                  if (_isSearching)
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        autofocus: true,
                        textInputAction: TextInputAction.search,

                        onSubmitted: (value) {
                          _openSearchResults(value);
                        },

                        decoration: const InputDecoration(
                          hintText: 'Search articles...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xff888888),
                          ),
                        ),

                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xff222222),
                        ),
                      ),
                    )
                  else
                    const Expanded(
                      child: Text(
                        'Explore',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff222222),
                        ),
                      ),
                    ),

              
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),

                    onPressed: () {
                      setState(() {
                        if (_isSearching) {
                          _isSearching = false;
                          _searchController.clear();
                        } else {
                          _isSearching = true;
                        }
                      });
                    },

                    icon: Icon(
                      _isSearching
                          ? Icons.close
                          : Icons.search,
                      size: 23,
                      color: const Color(0xff222222),
                    ),
                  ),
                ],
              ),
            ),

         
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                  24,
                  10,
                  24,
                  20,
                ),
                child: _buildNormalContent(),
              ),
            ),
          ],
        ),
      ),

   
      bottomNavigationBar: AppBottomNav(
        selectedIndex: selectedIndex,

        onItemTapped: (index) {
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const BookmarkScreen(),
              ),
            );
            return;
          }

          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const WeatherScreen(),
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


  Widget _buildNormalContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     
        SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _category(
                'Travel',
                selected: true,
              ),
              _category('Technology'),
              _category('Business'),
              _category('Lifestyle'),
            ],
          ),
        ),

        const SizedBox(height: 11),

      
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            'assets/images/explorepic.jpg',
            width: double.infinity,
            height: 153,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          'Uncovering the Hidden Gems\nof the Amazon Forest',
          style: TextStyle(
            fontSize: 19,
            height: 1.1,
            fontWeight: FontWeight.w700,
            color: Color(0xff252525),
          ),
        ),

        const SizedBox(height: 7),

        _authorRow(
          name: 'Mr. Lana Kub',
          date: 'May 1, 2023',
        ),

        const SizedBox(height: 29),

        _articleItem(
          title:
              'Experience the Serenity of\nJapan\'s Traditional...',
          date: 'May 3, 2023',
          image: 'assets/images/flower.jpg',
          author: 'Hilda Friesen',
        ),

        const SizedBox(height: 16),

       
        _articleItem(
          title:
              'A Journey Through Time:\nDiscovering the Nile river',
          date: 'May 7, 2023',
          image: 'assets/images/sea.jpg',
          author: 'Melissa White',
        ),

        const SizedBox(height: 16),

      
        _articleItem(
          title:
              'Chasing the Northern\nLights: A Winter in Finland',
          date: 'May 12, 2023',
          image: 'assets/images/men.jpg',
          author: 'Jeannie Conn',
        ),
      ],
    );
  }

  
  Widget _category(
    String text, {
    bool selected = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 9),
      padding: const EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xffe6e9f2)
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: selected
            ? null
            : Border.all(
                color: const Color(0xffe4e7ed),
                width: 1,
              ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Georgia',
          fontSize: 12,
          fontWeight:
              selected ? FontWeight.w700 : FontWeight.w600,
          color: const Color(0xff333333),
        ),
      ),
    );
  }

  
  Widget _authorRow({
    required String name,
    required String date,
  }) {
    return Row(
      children: [
        Container(
          width: 19,
          height: 19,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          clipBehavior: Clip.antiAlias,

        
          child: Image.asset(
            'assets/images/person.png',
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(width: 6),

        Text(
          name,
          style: const TextStyle(
            fontSize: 9,
            color: Color(0xff707070),
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(width: 4),

        const Text(
          '•',
          style: TextStyle(
            fontSize: 9,
            color: Color(0xff999999),
          ),
        ),

        const SizedBox(width: 4),

        Text(
          date,
          style: const TextStyle(
            fontSize: 9,
            color: Color(0xff707070),
          ),
        ),
      ],
    );
  }


  Widget _articleItem({
    required String title,
    required String date,
    required String image,
    String? author,
  }) {
    return SizedBox(
      height: 62,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff292929),
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),

                     
                      child: Image.asset(
                        'assets/images/person.png',
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 5),

                    Text(
                      author ?? _getAuthor(title),
                      style: const TextStyle(
                        fontSize: 8.5,
                        color: Color(0xff707070),
                      ),
                    ),

                    const SizedBox(width: 4),

                    const Text(
                      '•',
                      style: TextStyle(
                        fontSize: 8,
                        color: Color(0xff999999),
                      ),
                    ),

                    const SizedBox(width: 4),

                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 8.5,
                        color: Color(0xff707070),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              image,
              width: 83,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  
  String _getAuthor(String title) {
    if (title.contains('Japan')) {
      return 'Hilda Friesen';
    }

    if (title.contains('Nile')) {
      return 'Melissa White';
    }

    return 'Jeannie Conn';
  }
}
