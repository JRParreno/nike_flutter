import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nike_flutter/gen/assets.gen.dart';
import 'package:nike_flutter/src/features/home/data/models/nike_shoe_model.dart';
import 'package:nike_flutter/src/features/home/domain/repositories/nike_shoe_repository.dart';

class NikeShoeRepositoryImpl extends NikeShoeRepository {
  @override
  Future<NikeShoeModel> getNikeShoes() async {
    String data = await rootBundle.loadString(Assets.json.nikeShoes);

    return NikeShoeModel.fromMap(jsonDecode(data));
  }
}
