import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:nike_flutter/src/features/home/domain/entities/nike_collection.dart';

class NikeCollectionModel extends Equatable {
  final List<NikeCollection> nikeCollections;

  const NikeCollectionModel(this.nikeCollections);

  @override
  List<Object?> get props => [
        nikeCollections,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll(
        {'nikeCollections': nikeCollections.map((x) => x.toMap()).toList()});

    return result;
  }

  factory NikeCollectionModel.fromMap(Map<String, dynamic> map) {
    return NikeCollectionModel(
      List<NikeCollection>.from(
          map['nike_collections']?.map((x) => NikeCollection.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NikeCollectionModel.fromJson(String source) =>
      NikeCollectionModel.fromMap(json.decode(source));
}
