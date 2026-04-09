class Movie {
  final int id;
  final String title;
  final String year;
  final String mediumCoverImage;
  final String backgroundImage;
  final double rating;
  final int runtime; // Added this field
  final String descriptionFull;
  final List<String> genres;
  final List<String> screenshots;
  final List<CastMember> cast;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.mediumCoverImage,
    required this.backgroundImage,
    required this.rating,
    required this.runtime, // Added this field
    required this.descriptionFull,
    required this.genres,
    required this.screenshots,
    required this.cast,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'] ?? '',
      year: json['year']?.toString() ?? '',
      mediumCoverImage: json['medium_cover_image'] ?? '',
      backgroundImage: json['background_image_original'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      runtime: (json['runtime'] as num?)?.toInt() ?? 0, // Parse runtime as int
      descriptionFull: json['description_full'] ?? "No description available.",
      genres: List<String>.from(json['genres'] ?? []),
      screenshots: [
        if (json['large_screenshot_image1'] != null)
          json['large_screenshot_image1'],
        if (json['large_screenshot_image2'] != null)
          json['large_screenshot_image2'],
        if (json['large_screenshot_image3'] != null)
          json['large_screenshot_image3'],
      ],
      cast:
          (json['cast'] as List?)
              ?.map((c) => CastMember.fromJson(c))
              .toList() ??
          [],
    );
  }
}

class CastMember {
  final String name;
  final String characterName;
  final String? urlSmallImage;

  CastMember({
    required this.name,
    required this.characterName,
    this.urlSmallImage,
  });

  factory CastMember.fromJson(Map<String, dynamic> json) {
    return CastMember(
      name: json['name'] ?? "Unknown",
      characterName: json['character_name'] ?? "",
      urlSmallImage: json['url_small_image'],
    );
  }
}
