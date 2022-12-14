import 'package:dartz/dartz.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/entities/post_entity.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/repositories/i_post_repository.dart';

import '../../../../core/error/error.dart';
import '../entities/get_post_parameters_model.dart';

abstract class IGetAllPostsUsecase {
  Future<Either<Failure, List<PostEntity>>> call({required PostParametersRequest postParametersRequest});
}

class GetAllPostsUsecase implements IGetAllPostsUsecase {
  final IPostRepository _postRepository;

  const GetAllPostsUsecase(this._postRepository);

  @override
  Future<Either<Failure, List<PostEntity>>> call({required PostParametersRequest postParametersRequest}) async {
    return await _postRepository.getAllPosts(postParametersRequest: postParametersRequest);
  }
}
