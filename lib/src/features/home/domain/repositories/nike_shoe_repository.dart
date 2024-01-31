import 'package:nike_flutter/src/features/home/data/models/nike_shoe_model.dart';

abstract class NikeShoeRepository {
  Future<NikeShoeModel> getNikeShoes();
}
