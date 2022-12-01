import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_prot/app/modules/post/di/post_binds.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [...postBinds];
}
