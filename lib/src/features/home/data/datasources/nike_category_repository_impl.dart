import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nike_flutter/gen/assets.gen.dart';
import 'package:nike_flutter/src/features/home/data/models/nike_category_model.dart';
import 'package:nike_flutter/src/features/home/domain/repositories/nike_category_repository.dart';

class NikeCategoryRepositoryImpl extends NikeCategoryRepository {
  @override
  Future<NikeCategoryModel> getNikeCategory() async {
    String data = await rootBundle.loadString(Assets.json.nikeCategories);

    return NikeCategoryModel.fromMap(jsonDecode(data));
  }
}
