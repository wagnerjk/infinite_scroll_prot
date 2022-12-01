import 'package:dartz/dartz.dart';
import 'package:infinite_scroll_prot/app/core/error/error.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/entities/get_post_parameters_model.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/entities/post_entity.dart';

abstract class IPostRepository {
  Future<Either<Failure, List<PostEntity>>> getAllPosts({required PostParametersRequest postParametersRequest});
}
