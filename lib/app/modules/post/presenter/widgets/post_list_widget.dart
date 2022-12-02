import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_prot/app/modules/post/presenter/blocs/events/post_events.dart';
import 'package:infinite_scroll_prot/app/modules/post/presenter/blocs/post_bloc.dart';

const int numberOfPostPerRequest = 10;

class PostListWidget extends StatefulWidget {
  const PostListWidget({super.key});

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  final postBloc = Modular.get<PostBloc>();
  late int _pageNumber = 0;

  @override
  void initState() {
    // postBloc.add(LoadPostEvent(parametersRequest));
    super.initState();
  }

  @override
  void dispose() {
    postBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
