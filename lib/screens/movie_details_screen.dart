import 'package:flutter/material.dart';
import 'package:movieexplorer/screens/booking_screen.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String title;
  final String image;
  final List<Map<String, String>> genres;
  final String year;
  final String duration;
  final String imdbRating;
  final String description;
  final List<Map<String, String>> cast;

  const MovieDetailsScreen({
    super.key,
    required this.title,
    required this.image,
    required this.genres,
    required this.year,
    required this.duration,
    required this.imdbRating,
    required this.description,
    required this.cast,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  // Sample dates & times
  final List<Map<String, String>> dates = [
    {"day": "Mon", "date": "21"},
    {"day": "Tue", "date": "22"},
    {"day": "Wed", "date": "23"},
    {"day": "Thu", "date": "24"},
  ];

  final List<String> times = ["10:00 AM", "1:00 PM", "4:00 PM", "7:00 PM"];

  String selectedDate = "21";
  String selectedTime = "10:00 AM";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: 160,
            ), // leave space for bottom container
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top background + buttons
                Stack(
                  children: [
                    Image.asset(
                      widget.image,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      height: 250,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.play_arrow),
                          label: Text("Watch Trailer"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 16,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 16,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12),

                // Genre Chips
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: widget.genres
                        .map(
                          (genre) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Chip(
                              avatar: genre['icon'] != null
                                  ? Image.asset(
                                      genre['icon']!,
                                      width: 20,
                                      height: 20,
                                    )
                                  : null,
                              label: Text(genre['name']!),
                              backgroundColor: Colors.grey[200],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),

                SizedBox(height: 8),

                // Movie Title
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(height: 8),

                // Info Chips
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Chip(label: Text(widget.year)),
                      SizedBox(width: 8),
                      Chip(label: Text(widget.duration)),
                      SizedBox(width: 8),
                      Chip(label: Text("IMDb ${widget.imdbRating}")),
                    ],
                  ),
                ),

                SizedBox(height: 12),

                // Description
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                ),

                SizedBox(height: 16),

                // Cast
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Cast",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: widget.cast.length,
                    itemBuilder: (context, index) {
                      final member = widget.cast[index];
                      return Container(
                        width: 100,
                        margin: EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            SizedBox(height: 4),
                            Text(
                              member['name']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              member['role']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 24),
              ],
            ),
          ),

          // Bottom Booking Container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, -3),
                  ),
                ],
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Date selector - Calendar style
                  SizedBox(
                    height: 60,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: dates.length,
                      separatorBuilder: (_, __) =>
                          VerticalDivider(width: 1, color: Colors.grey),
                      itemBuilder: (context, index) {
                        final date = dates[index];
                        bool isSelected = selectedDate == date["date"];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = date["date"]!;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.redAccent
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  date["day"]!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  date["date"]!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 8),

                  // Time slots
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: times.length,
                      itemBuilder: (context, index) {
                        final time = times[index];
                        bool isSelected = selectedTime == time;
                        return Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(time),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                selectedTime = time;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 12),

                  // Book Now Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookingScreen(
                              movieTitle: "Avengers",
                              movieDate: "21 Jan 2026",
                              movieTime: "7:30 PM",
                              movieRow: "C", // Add row
                              seatNumber: "C12",
                              movieImage:
                                  "assets/images/onboarding_initial.png", // Pass the movie poster
                            ),
                          ),
                        );

                        // Navigate to Booking confirmation
                      },
                      child: Text("Book Now", style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
