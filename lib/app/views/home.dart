import 'package:flutter/material.dart';
import 'package:infinite_scroll_prot/app/modules/post/presenter/widgets/post_list_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite scroll'),
      ),
      body: const PostListWidget(),
    );
  }
}
