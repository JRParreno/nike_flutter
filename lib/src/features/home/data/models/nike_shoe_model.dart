import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:nike_flutter/src/features/home/domain/entities/nike_shoe.dart';

class NikeShoeModel extends Equatable {
  final List<NikeShoe> nikeShoes;

  const NikeShoeModel(this.nikeShoes);

  @override
  List<Object?> get props => [
        nikeShoes,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nikeShoes': nikeShoes.map((x) => x.toMap()).toList()});

    return result;
  }

  factory NikeShoeModel.fromMap(Map<String, dynamic> map) {
    return NikeShoeModel(
      List<NikeShoe>.from(map['nike_shoes']?.map((x) => NikeShoe.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NikeShoeModel.fromJson(String source) =>
      NikeShoeModel.fromMap(json.decode(source));
}
