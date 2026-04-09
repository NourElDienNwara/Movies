class Movie {
  final int id;
  final String title;
  final String mediumCoverImage;
  final double rating;
  final List<String>? genres;

  Movie({
    required this.id,
    required this.title,
    required this.mediumCoverImage,
    required this.rating,
    this.genres,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      mediumCoverImage: json['medium_cover_image'],
      rating: (json['rating'] as num).toDouble(),
      genres: json['genres'] != null ? List<String>.from(json['genres']) : [],
    );
  }
}
