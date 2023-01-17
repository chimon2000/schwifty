import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode extends Equatable {
  const Episode({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  final int? id;
  final String? name;
  @JsonKey(name: 'air_date')
  final String? airDate;
  final String? episode;
  final List<String>? characters;
  final String? url;
  final DateTime? created;

  factory Episode.fromJson(Map<String, dynamic> json) {
    return _$EpisodeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      airDate,
      episode,
      characters,
      url,
      created,
    ];
  }
}
