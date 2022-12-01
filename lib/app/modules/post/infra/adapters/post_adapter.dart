import 'package:infinite_scroll_prot/app/modules/post/domain/entities/post_entity.dart';

class PostAdapter {
  static PostEntity fromJson(dynamic json) {
    return PostEntity(title: json['title'], body: json['body']);
  }
}
