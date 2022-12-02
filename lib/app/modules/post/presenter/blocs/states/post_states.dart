import 'package:infinite_scroll_prot/app/core/error/error.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/entities/post_entity.dart';

abstract class PostState {}

class PostInitial implements PostState {}

class PostLoading implements PostState {}

class PostSucess implements PostState {
  final List<PostEntity> posts;

  PostSucess(this.posts);
}

class PostError implements PostState {
  final Failure error;

  PostError(this.error);
}
