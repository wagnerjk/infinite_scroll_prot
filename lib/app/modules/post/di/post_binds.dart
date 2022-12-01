import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/repositories/i_post_repository.dart';
import 'package:infinite_scroll_prot/app/modules/post/domain/usecases/get_all_posts_usecase.dart';
import 'package:infinite_scroll_prot/app/modules/post/external/post_datasource.dart';
import 'package:infinite_scroll_prot/app/modules/post/infra/datasource/i_post_datasource.dart';
import 'package:infinite_scroll_prot/app/modules/post/infra/repositories/post_repository.dart';

List<Bind> get postBinds => [
      // Dio
      Bind.lazySingleton<Dio>((i) => Dio()),

      // Datasource
      Bind.lazySingleton<IPostDatasource>((i) => PostDatasource(i())),

      // Repositories
      Bind.lazySingleton<IPostRepository>((i) => PostRepository(i())),

      // Usecases
      Bind.lazySingleton<IGetAllPostsUsecase>((i) => GetAllPostsUsecase(i()))
    ];
