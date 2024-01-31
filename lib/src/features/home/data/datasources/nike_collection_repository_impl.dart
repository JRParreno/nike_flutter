import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nike_flutter/gen/assets.gen.dart';
import 'package:nike_flutter/src/features/home/data/models/nike_collection_model.dart';
import 'package:nike_flutter/src/features/home/domain/repositories/nike_collection_repository.dart';

class NikeCollectionRepositoryImpl extends NikeCollectionRepository {
  @override
  Future<NikeCollectionModel> getNikeCollections() async {
    String data = await rootBundle.loadString(Assets.json.nikeCollections);

    return NikeCollectionModel.fromMap(jsonDecode(data));
  }
}
