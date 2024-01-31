import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:nike_flutter/src/features/home/domain/entities/nike_category.dart';

class NikeCategoryModel extends Equatable {
  final List<NikeCategory> nikeCategories;

  const NikeCategoryModel(this.nikeCategories);

  @override
  List<Object?> get props => [nikeCategories];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll(
        {'nikeCategories': nikeCategories.map((x) => x.toMap()).toList()});

    return result;
  }

  factory NikeCategoryModel.fromMap(Map<String, dynamic> map) {
    return NikeCategoryModel(
      List<NikeCategory>.from(
          map['nike_categories']?.map((x) => NikeCategory.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NikeCategoryModel.fromJson(String source) =>
      NikeCategoryModel.fromMap(json.decode(source));
}
