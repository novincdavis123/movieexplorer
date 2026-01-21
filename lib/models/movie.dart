// Movie Model
class Movie {
  final int id;
  final String title;
  final String image;
  final String description;
  final List<String> genres;
  final String year;
  final String duration;
  final String imdbRating;

  Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.genres,
    required this.year,
    required this.duration,
    required this.imdbRating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
      genres: List<String>.from(json['genres']),
      year: json['year'],
      duration: json['duration'],
      imdbRating: json['imdbRating'],
    );
  }
}

// Booking Response Model
class BookingResponse {
  final String bookingId;
  final String movieTitle;
  final String date;
  final String time;
  final String seat;

  BookingResponse({
    required this.bookingId,
    required this.movieTitle,
    required this.date,
    required this.time,
    required this.seat,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      bookingId: json['bookingId'],
      movieTitle: json['movieTitle'],
      date: json['date'],
      time: json['time'],
      seat: json['seat'],
    );
  }
}
