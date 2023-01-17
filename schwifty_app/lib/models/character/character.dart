import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'location.dart';
import 'origin.dart';

part 'character.g.dart';

@JsonSerializable()
class Character extends Equatable {
  const Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final Origin? origin;
  final Location? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final DateTime? created;

  factory Character.fromJson(Map<String, dynamic> json) {
    return _$CharacterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      status,
      species,
      type,
      gender,
      origin,
      location,
      image,
      episode,
      url,
      created,
    ];
  }
}
