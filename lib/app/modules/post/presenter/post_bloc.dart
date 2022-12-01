import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/entities/get_post_parameters_model.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/usecases/get_all_posts_usecase.dart';
import 'package:infinite_scroll_prot/app/modules/post/presenter/states/post_states.dart';

class PostBloc extends Bloc<void, PostState> {
  final GetAllPostsUsecase getAllPostsUsecase;

  PostBloc(this.getAllPostsUsecase) : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(PostParametersRequest parametersRequest) async* {
    yield PostLoading();
    final result = await getAllPostsUsecase(postParametersRequest: parametersRequest);
    yield result.fold((l) => PostError(l), (r) => PostSucess(r));
  }
}
