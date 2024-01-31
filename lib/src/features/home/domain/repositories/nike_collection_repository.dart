import 'package:nike_flutter/src/features/home/data/models/nike_collection_model.dart';

abstract class NikeCollectionRepository {
  Future<NikeCollectionModel> getNikeCollections();
}
