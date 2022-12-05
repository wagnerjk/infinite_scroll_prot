import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/entities/get_post_parameters_model.dart';
import 'package:infinite_scroll_prot/app/modules/post/presenter/blocs/events/post_events.dart';
import 'package:infinite_scroll_prot/app/modules/post/presenter/blocs/post_bloc.dart';
import 'package:infinite_scroll_prot/app/modules/post/presenter/blocs/states/post_states.dart';

const int numberOfPostsPerRequest = 5;

class PostListWidget extends StatefulWidget {
  const PostListWidget({super.key});

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  final postBloc = Modular.get<PostBloc>();
  late int _pageNumber = 1;
  var _isLastPage = false;
  final int _nextPageTrigger = 3;
  final list = [];

  PostParametersRequest get parametersRequest => PostParametersRequest(_pageNumber, numberOfPostsPerRequest);

  void _atualiza() {
    if (postBloc.state is PostSucess) {
      //   setState(() {
      _isLastPage = (postBloc.state as PostSucess).posts.length < numberOfPostsPerRequest;
      _pageNumber++;
      //   });
    }
  }

  void _fetchPosts() {
    postBloc.add(LoadPostEvent(parametersRequest));
    _atualiza();
  }

  @override
  void initState() {
    _fetchPosts();
    super.initState();
  }

  @override
  void dispose() {
    postBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: postBloc.stream,
      builder: (context, _) {
        final state = postBloc.state;

        if (state is PostInitial) {
          return const Center(
            child: Text('nada ainda'),
          );
        }

        if (state is PostLoading && list.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is PostError) {
          return const Center(
            child: Text('houve um erro'),
          );
        }
        if (state is PostSucess) {
          list.addAll(state.posts);
        }
        return ListView.builder(
          itemCount: list.length + (_isLastPage ? 0 : 1),
          itemBuilder: (context, index) {
            if (state is! PostLoading && (index == list.length - _nextPageTrigger)) {
              _fetchPosts();
            }

            if (index == list.length) {
              if (state is PostLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }

            final item = list[index];
            return ListTile(
              title: Text('${item.id} - ${item.title}'),
              subtitle: Text(item.body),
            );
          },
        );
      },
    );
  }
}
