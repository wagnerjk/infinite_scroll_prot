import 'package:infinite_scroll_prot/app/core/error/error.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/entities/post_entity.dart';

abstract class PostState {
  PostState();
}

class PostInitial extends PostState {
  PostInitial();
}

class PostLoading extends PostState {
  PostLoading();
}

class PostSucess extends PostState {
  final List<PostEntity> posts;
  final bool isLastPage;

  PostSucess(this.posts, this.isLastPage);
}

class PostError extends PostState {
  final Failure error;

  PostError(this.error);
}
