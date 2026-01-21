import 'package:flutter/material.dart';
import 'package:movieexplorer/screens/movie_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCarouselIndex = 0;

  final List<String> carouselMovies = [
    "assets/images/onboarding_secondary.png",
    "assets/images/onboarding_secondary.png",
    "assets/images/onboarding_secondary.png",
  ];

  final List<String> popularMovies = [
    "assets/images/onboarding_secondary.png",
    "assets/images/onboarding_secondary.png",
    "assets/images/onboarding_secondary.png",
    "assets/images/onboarding_secondary.png",
  ];

  final PageController _carouselController = PageController(
    viewportFraction: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/onboarding_initial.png",
                width: double.infinity,
                height: 430,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 24,
                right: 24,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search movies",
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    // Chips
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Chip(label: Text("Drama")),
                          SizedBox(width: 8),
                          Chip(label: Text("12+")),
                          SizedBox(width: 8),
                          Chip(label: Text("Action")),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    // Carousel
                    SizedBox(
                      height: 180,
                      child: PageView.builder(
                        controller: _carouselController,
                        itemCount: carouselMovies.length,
                        onPageChanged: (index) {
                          setState(() => _currentCarouselIndex = index);
                        },
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MovieDetailsScreen(
                                    title: "Avengers",
                                    image:
                                        "assets/images/onboarding_secondary.png",
                                    genres: [
                                      {
                                        "icon": "assets/icons/action.png",
                                        "name": "Action",
                                      },
                                      {
                                        "icon": "assets/icons/scifi.png",
                                        "name": "Sci-Fi",
                                      },
                                    ],
                                    year: "2012",
                                    duration: "2h 23m",
                                    imdbRating: "8.0",
                                    description:
                                        "Earth's mightiest heroes must come together...",
                                    cast: [
                                      {
                                        "name": "Robert Downey Jr.",
                                        "role": "Iron Man",
                                        "image": "assets/images/rdj.png",
                                      },
                                      {
                                        "name": "Chris Evans",
                                        "role": "Captain America",
                                        "image": "assets/images/cevans.png",
                                      },
                                      {
                                        "name": "Scarlett Johansson",
                                        "role": "Black Widow",
                                        "image": "assets/images/scarlett.png",
                                      },
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage(carouselMovies[index]),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12),
                    // Carousel indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        carouselMovies.length,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: _currentCarouselIndex == index ? 12 : 8,
                          height: _currentCarouselIndex == index ? 12 : 8,
                          decoration: BoxDecoration(
                            color: _currentCarouselIndex == index
                                ? Colors.black
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Title for horizontal scroll list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Popular Movies",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SizedBox(height: 12),

          // Horizontal scrollable list
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24),
              itemCount: popularMovies.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieDetailsScreen(
                          title: "Avengers",
                          image: "assets/images/onboarding_secondary.png",
                          genres: [
                            {
                              "icon": "assets/icons/action.png",
                              "name": "Action",
                            },
                            {
                              "icon": "assets/icons/scifi.png",
                              "name": "Sci-Fi",
                            },
                          ],
                          year: "2012",
                          duration: "2h 23m",
                          imdbRating: "8.0",
                          description:
                              "Earth's mightiest heroes must come together...",
                          cast: [
                            {
                              "name": "Robert Downey Jr.",
                              "role": "Iron Man",
                              "image": "assets/images/rdj.png",
                            },
                            {
                              "name": "Chris Evans",
                              "role": "Captain America",
                              "image": "assets/images/cevans.png",
                            },
                            {
                              "name": "Scarlett Johansson",
                              "role": "Black Widow",
                              "image": "assets/images/scarlett.png",
                            },
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 180,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(popularMovies[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 24),

          // Repeat another horizontal list if needed
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Top Rated",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24),
              itemCount: popularMovies.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieDetailsScreen(
                          title: "Avengers",
                          image: "assets/images/onboarding_secondary.png",
                          genres: [
                            {
                              "icon": "assets/icons/action.png",
                              "name": "Action",
                            },
                            {
                              "icon": "assets/icons/scifi.png",
                              "name": "Sci-Fi",
                            },
                          ],
                          year: "2012",
                          duration: "2h 23m",
                          imdbRating: "8.0",
                          description:
                              "Earth's mightiest heroes must come together...",
                          cast: [
                            {
                              "name": "Robert Downey Jr.",
                              "role": "Iron Man",
                              "image": "assets/images/rdj.png",
                            },
                            {
                              "name": "Chris Evans",
                              "role": "Captain America",
                              "image": "assets/images/cevans.png",
                            },
                            {
                              "name": "Scarlett Johansson",
                              "role": "Black Widow",
                              "image": "assets/images/scarlett.png",
                            },
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(popularMovies[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 24),
        ],
      ),
    );
  }
}
