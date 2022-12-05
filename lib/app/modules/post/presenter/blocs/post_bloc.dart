import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/entities/post_entity.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/usecases/get_all_posts_usecase.dart';
import 'package:infinite_scroll_prot/app/modules/post/presenter/blocs/events/post_events.dart';
import 'package:infinite_scroll_prot/app/modules/post/presenter/blocs/states/post_states.dart';

class PostBloc extends Bloc<PostEvents, PostState> {
  final GetAllPostsUsecase getAllPostsUsecase;

  PostBloc(this.getAllPostsUsecase) : super(PostInitial()) {
    on<LoadPostEvent>(
      (event, emit) async {
        final list = <PostEntity>[];
        if (state is PostSucess) {
          list.addAll(state.posts);
        }
        emit(PostLoading());
        await Future.delayed(const Duration(seconds: 2));
        final result = await getAllPostsUsecase(postParametersRequest: event.parametersRequest);
        emit(result.fold((l) => PostError(l), (r) {
          list.addAll(r);
          return PostSucess(list);
        }));
      },
    );
  }

  load(LoadPostEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());
    final result = await getAllPostsUsecase(postParametersRequest: event.parametersRequest);
    emit(result.fold((l) => PostError(l), (r) => PostSucess(r)));
  }

//   @override
//   Stream<PostState> mapEventToState(PostParametersRequest parametersRequest) async* {
//     yield PostLoading();
//     final result = await getAllPostsUsecase(postParametersRequest: parametersRequest);
//     yield result.fold((l) => PostError(l), (r) => PostSucess(r));
//   }
}
