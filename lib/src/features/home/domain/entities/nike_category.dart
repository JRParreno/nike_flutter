import 'dart:convert';

import 'package:equatable/equatable.dart';

class NikeCategory extends Equatable {
  final String id;
  final String name;
  final String? iconUrl;

  const NikeCategory({
    required this.id,
    required this.name,
    this.iconUrl,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        iconUrl,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    if (iconUrl != null) {
      result.addAll({'icon_url': iconUrl});
    }

    return result;
  }

  factory NikeCategory.fromMap(Map<String, dynamic> map) {
    return NikeCategory(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      iconUrl: map['icon_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NikeCategory.fromJson(String source) =>
      NikeCategory.fromMap(json.decode(source));
}
