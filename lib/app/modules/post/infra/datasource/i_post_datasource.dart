import '../../domain/entities/get_post_parameters_model.dart';

abstract class IPostDatasource {
  Future<List> getAllPosts({required PostParametersRequest postParametersRequest});
}
