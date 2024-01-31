import 'dart:convert';

import 'package:equatable/equatable.dart';

class NikeCollection extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  const NikeCollection({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'image_url': imageUrl});

    return result;
  }

  factory NikeCollection.fromMap(Map<String, dynamic> map) {
    return NikeCollection(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['image_url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NikeCollection.fromJson(String source) =>
      NikeCollection.fromMap(json.decode(source));
}
