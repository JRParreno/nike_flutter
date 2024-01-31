import 'package:nike_flutter/src/features/home/data/models/nike_category_model.dart';

abstract class NikeCategoryRepository {
  Future<NikeCategoryModel> getNikeCategory();
}
