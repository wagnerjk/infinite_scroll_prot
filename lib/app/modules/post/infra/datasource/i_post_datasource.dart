import '../../domain/entities/get_post_parameters_model.dart';

abstract class IPostDatasource {
  Future<List<Map<String, dynamic>>> getAllPosts({required PostParametersRequest postParametersRequest});
}
