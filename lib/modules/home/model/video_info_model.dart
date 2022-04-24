import 'dart:convert';

class VideoInfoModel {
  final int id;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool adult;
  VideoInfoModel({
    required this.id,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.adult,
  });

  VideoInfoModel copyWith({
    int? id,
    String? backdropPath,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? adult,
  }) {
    return VideoInfoModel(
      id: id ?? this.id,
      backdropPath: backdropPath ?? this.backdropPath,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      adult: adult ?? this.adult,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'backdrop_path': backdropPath});
    result.addAll({'original_language': originalLanguage});
    result.addAll({'original_title': originalTitle});
    result.addAll({'overview': overview});
    result.addAll({'popularity': popularity});
    result.addAll({'poster_path': posterPath});
    result.addAll({'release_date': releaseDate});
    result.addAll({'title': title});
    result.addAll({'adult': adult});

    return result;
  }

  factory VideoInfoModel.fromMap(Map<String, dynamic> map) {
    return VideoInfoModel(
      id: map['id']?.toInt() ?? 0,
      backdropPath: map['backdropPath'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
      title: map['title'] ?? '',
      adult: map['adult'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoInfoModel.fromJson(String source) =>
      VideoInfoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VideoInfoModel(id: $id, backdropPath: $backdropPath, original_language: $originalLanguage, original_title: $originalTitle, overview: $overview, popularity: $popularity, poster_path: $posterPath, release_date: $releaseDate, title: $title, adult: $adult)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VideoInfoModel &&
        other.id == id &&
        other.backdropPath == backdropPath &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.posterPath == posterPath &&
        other.releaseDate == releaseDate &&
        other.title == title &&
        other.adult == adult;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        backdropPath.hashCode ^
        originalLanguage.hashCode ^
        originalTitle.hashCode ^
        overview.hashCode ^
        popularity.hashCode ^
        posterPath.hashCode ^
        releaseDate.hashCode ^
        title.hashCode ^
        adult.hashCode;
  }
}
