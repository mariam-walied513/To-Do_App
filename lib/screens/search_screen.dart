import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final String query;
  final List<Map<String, String>> articles;

  const SearchScreen({
    super.key,
    required this.query,
    required this.articles,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late String searchQuery;

  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();

    searchQuery = widget.query;
  }

 
  List<Map<String, String>> get filteredArticles {
    final query = searchQuery.toLowerCase().trim();

    return widget.articles.where((article) {
      final title =
          article['title']!.toLowerCase();

      final author =
          article['author']!.toLowerCase();

      final category =
          article['category']!;

      final matchesSearch =
          title.contains(query) ||
          author.contains(query);

      final matchesCategory =
          selectedCategory == 'All' ||
          category == selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final results = filteredArticles;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
         
            SizedBox(
              height: 58,
              child: Row(
                children: [
                  const SizedBox(width: 10),

                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 22,
                      color: Color(0xff222222),
                    ),
                  ),

                  const SizedBox(width: 13),

                  const Text(
                    'Search results',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff222222),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 37,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 21,
                ),
                scrollDirection: Axis.horizontal,
                children: [
                  _categoryButton(
                    'All',
                    widget.articles.length.toString(),
                  ),

                  _categoryButton(
                    'Travel',
                    '51',
                  ),

                  _categoryButton(
                    'Technology',
                    '16',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 11),

          
            Expanded(
              child: results.isEmpty
                  ? _buildEmptyResults()
                  : ListView.builder(
                      physics:
                          const BouncingScrollPhysics(),

                      padding: const EdgeInsets.fromLTRB(
                        21,
                        2,
                        21,
                        20,
                      ),

                      itemCount: results.length,

                      itemBuilder: (context, index) {
                        final article =
                            results[index];

                        return Padding(
                          padding:
                              const EdgeInsets.only(
                            bottom: 15,
                          ),

                          child:
                              _searchArticleItem(
                            title:
                                article['title']!,
                            author:
                                article['author']!,
                            date:
                                article['date']!,
                            image:
                                article['image']!,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

 
  Widget _categoryButton(
    String title,
    String count,
  ) {
    final isSelected =
        selectedCategory == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },

      child: Container(
        margin: const EdgeInsets.only(
          right: 9,
        ),

        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 7,
        ),

        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xffe9edf9)
              : Colors.white,

          borderRadius:
              BorderRadius.circular(20),

          border: isSelected
              ? null
              : Border.all(
                  color:
                      const Color(0xffe1e4ea),
                  width: 1,
                ),
        ),

        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: title,

                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 12,
                  fontWeight: isSelected
                      ? FontWeight.w700
                      : FontWeight.w600,
                  color:
                      const Color(0xff333333),
                ),
              ),

              TextSpan(
                text: ' ($count)',

                style: const TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 11,
                  color:
                      Color(0xff777777),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _searchArticleItem({
    required String title,
    required String author,
    required String date,
    required String image,
  }) {
    return SizedBox(
      height: 72,

      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.center,

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

                  overflow:
                      TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 14.5,
                    height: 1.12,
                    fontWeight:
                        FontWeight.w700,
                    color:
                        Color(0xff292929),
                  ),
                ),

                const SizedBox(height: 6),

               
                Row(
                  children: [
                 
                    Container(
                      width: 18,
                      height: 18,

                      clipBehavior:
                          Clip.antiAlias,

                      decoration:
                          const BoxDecoration(
                        shape:
                            BoxShape.circle,
                      ),

                      child: Image.asset(
                        'assets/images/person.png',
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 5),

                 
                    Flexible(
                      child: Text(
                        author,

                        maxLines: 1,

                        overflow:
                            TextOverflow.ellipsis,

                        style:
                            const TextStyle(
                          fontSize: 8.5,
                          color:
                              Color(0xff707070),
                          fontWeight:
                              FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(width: 4),

                    const Text(
                      '•',
                      style: TextStyle(
                        fontSize: 8,
                        color:
                            Color(0xff999999),
                      ),
                    ),

                    const SizedBox(width: 4),

                    // DATE
                    Text(
                      date,

                      style:
                          const TextStyle(
                        fontSize: 8.5,
                        color:
                            Color(0xff707070),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

        
          ClipRRect(
            borderRadius:
                BorderRadius.circular(6),

            child: Image.asset(
              image,

              width: 91,
              height: 64,

              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildEmptyResults() {
    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [
          const Icon(
            Icons.search_off,
            size: 55,
            color: Color(0xffcccccc),
          ),

          const SizedBox(height: 12),

          Text(
            'No results found for "$searchQuery"',

            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 15,
              color: Color(0xff888888),
            ),
          ),
        ],
      ),
    );
  }
}
