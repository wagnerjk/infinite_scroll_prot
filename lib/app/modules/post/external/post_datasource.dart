import 'package:dio/dio.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/entities/get_post_parameters_model.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/errors/post_errors.dart';
import 'package:infinite_scroll_prot/app/modules/post/infra/datasource/i_post_datasource.dart';

const jsonUrl = 'https://jsonplaceholder.typicode.com/';

class PostDatasource implements IPostDatasource {
  final Dio _dio;

  const PostDatasource(this._dio);

  @override
  Future<List<Map<String, dynamic>>> getAllPosts({required PostParametersRequest postParametersRequest}) async {
    final response = await _dio.get("$jsonUrl?_page=${postParametersRequest.pageNumber}&_limit=${postParametersRequest.numberOfPostsPerRequest}");
    if (response.statusCode == 200) {
      final list = response.data as List<Map<String, dynamic>>;
      return list;
    } else {
      throw GetPostError();
    }
  }
}
