import 'dart:convert';

import 'package:flutter/foundation.dart';

class VideoEntityModelResponse {
  final int id;
  final List<VideoEntityModel> results;
  VideoEntityModelResponse({
    required this.id,
    required this.results,
  });

  VideoEntityModelResponse copyWith({
    int? id,
    List<VideoEntityModel>? results,
  }) {
    return VideoEntityModelResponse(
      id: id ?? this.id,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'results': results.map((x) => x.toMap()).toList()});

    return result;
  }

  factory VideoEntityModelResponse.fromMap(Map<String, dynamic> map) {
    return VideoEntityModelResponse(
      id: map['id']?.toInt() ?? 0,
      results: List<VideoEntityModel>.from(
          map['results']?.map((x) => VideoEntityModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoEntityModelResponse.fromJson(String source) =>
      VideoEntityModelResponse.fromMap(json.decode(source));

  @override
  String toString() => 'VideoEntityModelResponse(id: $id, results: $results)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VideoEntityModelResponse &&
        other.id == id &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode => id.hashCode ^ results.hashCode;
}

class VideoEntityModel {
  final String id;
  final String publishedAt;
  final String type;
  final String key;
  final String site;
  final String name;
  final String iso_3166_1;
  final String iso_639_1;
  VideoEntityModel({
    required this.id,
    required this.publishedAt,
    required this.type,
    required this.key,
    required this.site,
    required this.name,
    required this.iso_3166_1,
    required this.iso_639_1,
  });

  VideoEntityModel copyWith({
    String? id,
    String? publishedAt,
    String? type,
    String? key,
    String? site,
    String? name,
    String? iso_3166_1,
    String? iso_639_1,
  }) {
    return VideoEntityModel(
      id: id ?? this.id,
      publishedAt: publishedAt ?? this.publishedAt,
      type: type ?? this.type,
      key: key ?? this.key,
      site: site ?? this.site,
      name: name ?? this.name,
      iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
      iso_639_1: iso_639_1 ?? this.iso_639_1,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'published_at': publishedAt});
    result.addAll({'type': type});
    result.addAll({'key': key});
    result.addAll({'site': site});
    result.addAll({'name': name});
    result.addAll({'iso_3166_1': iso_3166_1});
    result.addAll({'iso_639_1': iso_639_1});

    return result;
  }

  factory VideoEntityModel.fromMap(Map<String, dynamic> map) {
    return VideoEntityModel(
      id: map['id'] ?? '',
      publishedAt: map['published_at'] ?? '',
      type: map['type'] ?? '',
      key: map['key'] ?? '',
      site: map['site'] ?? '',
      name: map['name'] ?? '',
      iso_3166_1: map['iso_3166_1'] ?? '',
      iso_639_1: map['iso_639_1'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoEntityModel.fromJson(String source) =>
      VideoEntityModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VideoEntityModel(id: $id, published_at: $publishedAt, type: $type, key: $key, site: $site, name: $name, iso_3166_1: $iso_3166_1, iso_639_1: $iso_639_1)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VideoEntityModel &&
        other.id == id &&
        other.publishedAt == publishedAt &&
        other.type == type &&
        other.key == key &&
        other.site == site &&
        other.name == name &&
        other.iso_3166_1 == iso_3166_1 &&
        other.iso_639_1 == iso_639_1;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        publishedAt.hashCode ^
        type.hashCode ^
        key.hashCode ^
        site.hashCode ^
        name.hashCode ^
        iso_3166_1.hashCode ^
        iso_639_1.hashCode;
  }
}
