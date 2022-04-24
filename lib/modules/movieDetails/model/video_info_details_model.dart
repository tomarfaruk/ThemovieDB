import 'dart:convert';

import 'package:flutter/foundation.dart';

class VideoInfoDetailsModel {
  final int id;
  final bool adult;
  final String backdropPath;
  final num budget;
  final int runtime;
  final int voteCount;
  final double popularity;
  final double voteAverage;
  final double revenue;
  final String homepage;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final List<VideoGenresModel> genres;
  VideoInfoDetailsModel({
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.runtime,
    required this.voteCount,
    required this.popularity,
    required this.voteAverage,
    required this.revenue,
    required this.homepage,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.genres,
  });

  VideoInfoDetailsModel copyWith({
    int? id,
    bool? adult,
    String? backdropPath,
    num? budget,
    int? runtime,
    int? voteCount,
    double? popularity,
    double? voteAverage,
    double? revenue,
    String? homepage,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    String? posterPath,
    String? releaseDate,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    List<VideoGenresModel>? genres,
  }) {
    return VideoInfoDetailsModel(
      id: id ?? this.id,
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      budget: budget ?? this.budget,
      runtime: runtime ?? this.runtime,
      voteCount: voteCount ?? this.voteCount,
      popularity: popularity ?? this.popularity,
      voteAverage: voteAverage ?? this.voteAverage,
      revenue: revenue ?? this.revenue,
      homepage: homepage ?? this.homepage,
      imdbId: imdbId ?? this.imdbId,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      title: title ?? this.title,
      video: video ?? this.video,
      genres: genres ?? this.genres,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'adult': adult});
    result.addAll({'backdrop_path': backdropPath});
    result.addAll({'budget': budget});
    result.addAll({'runtime': runtime});
    result.addAll({'vote_count': voteCount});
    result.addAll({'popularity': popularity});
    result.addAll({'vote_average': voteAverage});
    result.addAll({'revenue': revenue});
    result.addAll({'homepage': homepage});
    result.addAll({'imdb_id': imdbId});
    result.addAll({'original_language': originalLanguage});
    result.addAll({'original_title': originalTitle});
    result.addAll({'overview': overview});
    result.addAll({'poster_path': posterPath});
    result.addAll({'release_date': releaseDate});
    result.addAll({'status': status});
    result.addAll({'tagline': tagline});
    result.addAll({'title': title});
    result.addAll({'video': video});
    result.addAll({'genres': genres.map((x) => x.toMap()).toList()});

    return result;
  }

  factory VideoInfoDetailsModel.fromMap(Map<String, dynamic> map) {
    return VideoInfoDetailsModel(
      id: map['id']?.toInt() ?? 0,
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
      budget: map['budget'] ?? 0,
      runtime: map['runtime']?.toInt() ?? 0,
      voteCount: map['vote_count']?.toInt() ?? 0,
      popularity: map['popularity']?.toDouble() ?? 0.0,
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      revenue: map['revenue']?.toDouble() ?? 0.0,
      homepage: map['homepage'] ?? '',
      imdbId: map['imdb_id'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      posterPath: map['poster_path'] ?? '',
      releaseDate: map['release_date'] ?? '',
      status: map['status'] ?? '',
      tagline: map['tagline'] ?? '',
      title: map['title'] ?? '',
      video: map['video'] ?? false,
      genres: map['genres'] != null
          ? List<VideoGenresModel>.from(
              map['genres']?.map((x) => VideoGenresModel.fromMap(x)))
          : <VideoGenresModel>[],
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoInfoDetailsModel.fromJson(String source) =>
      VideoInfoDetailsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VideoInfoDetailsModel(id: $id, adult: $adult, backdrop_path: $backdropPath, budget: $budget, runtime: $runtime, vote_count: $voteCount, popularity: $popularity, vote_average: $voteAverage, revenue: $revenue, homepage: $homepage, imdb_id: $imdbId, original_language: $originalLanguage, original_title: $originalTitle, overview: $overview, poster_path: $posterPath, release_date: $releaseDate, status: $status, tagline: $tagline, title: $title, video: $video, genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VideoInfoDetailsModel &&
        other.id == id &&
        other.adult == adult &&
        other.backdropPath == backdropPath &&
        other.budget == budget &&
        other.runtime == runtime &&
        other.voteCount == voteCount &&
        other.popularity == popularity &&
        other.voteAverage == voteAverage &&
        other.revenue == revenue &&
        other.homepage == homepage &&
        other.imdbId == imdbId &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.posterPath == posterPath &&
        other.releaseDate == releaseDate &&
        other.status == status &&
        other.tagline == tagline &&
        other.title == title &&
        other.video == video &&
        listEquals(other.genres, genres);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        adult.hashCode ^
        backdropPath.hashCode ^
        budget.hashCode ^
        runtime.hashCode ^
        voteCount.hashCode ^
        popularity.hashCode ^
        voteAverage.hashCode ^
        revenue.hashCode ^
        homepage.hashCode ^
        imdbId.hashCode ^
        originalLanguage.hashCode ^
        originalTitle.hashCode ^
        overview.hashCode ^
        posterPath.hashCode ^
        releaseDate.hashCode ^
        status.hashCode ^
        tagline.hashCode ^
        title.hashCode ^
        video.hashCode ^
        genres.hashCode;
  }
}

class VideoGenresModel {
  final int id;
  final String name;
  VideoGenresModel({
    required this.id,
    required this.name,
  });

  VideoGenresModel copyWith({
    int? id,
    String? name,
  }) {
    return VideoGenresModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});

    return result;
  }

  factory VideoGenresModel.fromMap(Map<String, dynamic> map) {
    return VideoGenresModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoGenresModel.fromJson(String source) =>
      VideoGenresModel.fromMap(json.decode(source));

  @override
  String toString() => 'VideoGenresModel(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VideoGenresModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
