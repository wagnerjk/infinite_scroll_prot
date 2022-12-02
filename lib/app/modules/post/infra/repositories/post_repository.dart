import 'package:infinite_scroll_prot/app/modules/post/domain/entities/post_entity.dart';
import 'package:infinite_scroll_prot/app/core/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/errors/post_errors.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/repositories/i_post_repository.dart';
import 'package:infinite_scroll_prot/app/modules/post/infra/adapters/post_adapter.dart';
import 'package:infinite_scroll_prot/app/modules/post/infra/datasource/i_post_datasource.dart';

import '../../domain/entities/get_post_parameters_model.dart';

class PostRepository implements IPostRepository {
  final IPostDatasource _postDatasource;

  const PostRepository(this._postDatasource);

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts({required PostParametersRequest postParametersRequest}) async {
    try {
      final postsJson = await _postDatasource.getAllPosts(postParametersRequest: postParametersRequest);
      return Right(_convert(postsJson));
      // return Right(postsJson.map(_convert));
    } catch (e) {
      return Left(GetPostError());
    }
  }

  List<PostEntity> _convert(List postsJson) {
    return postsJson.map((PostAdapter.fromJson)).toList();
  }
}
