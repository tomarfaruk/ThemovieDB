import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'video_info_model.dart';

class MovieInfoListResponse {
  final int? page;
  final List<VideoInfoModel>? results;
  final int? totalPages;
  final int? totalResults;
  MovieInfoListResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  MovieInfoListResponse copyWith({
    int? page,
    List<VideoInfoModel>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return MovieInfoListResponse(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (page != null) {
      result.addAll({'page': page});
    }
    if (results != null) {
      result.addAll({'results': results!.map((x) => x.toMap()).toList()});
    }
    if (totalPages != null) {
      result.addAll({'totalPages': totalPages});
    }
    if (totalResults != null) {
      result.addAll({'totalResults': totalResults});
    }

    return result;
  }

  factory MovieInfoListResponse.fromMap(Map<String, dynamic> map) {
    return MovieInfoListResponse(
      page: map['page']?.toInt(),
      results: map['results'] != null
          ? List<VideoInfoModel>.from(
              map['results']?.map((x) => VideoInfoModel.fromMap(x)))
          : null,
      totalPages: map['totalPages']?.toInt(),
      totalResults: map['totalResults']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieInfoListResponse.fromJson(String source) =>
      MovieInfoListResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieInfoListResponse(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieInfoListResponse &&
        other.page == page &&
        listEquals(other.results, results) &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        results.hashCode ^
        totalPages.hashCode ^
        totalResults.hashCode;
  }
}
