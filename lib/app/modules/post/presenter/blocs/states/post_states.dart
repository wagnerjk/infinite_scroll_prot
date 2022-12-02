import 'package:infinite_scroll_prot/app/core/error/error.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/entities/post_entity.dart';

abstract class PostState {
  final List<PostEntity> posts;

  PostState(this.posts);
}

class PostInitial extends PostState {
  PostInitial() : super([]);
}

class PostLoading extends PostState {
  PostLoading() : super([]);
}

class PostSucess extends PostState {
//   final List<PostEntity> posts;

  PostSucess(List<PostEntity> posts) : super(posts);
}

class PostError extends PostState {
  final Failure error;

  PostError(this.error) : super([]);
}
