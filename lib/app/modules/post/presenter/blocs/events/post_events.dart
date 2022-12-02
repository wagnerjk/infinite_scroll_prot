import 'package:infinite_scroll_prot/app/modules/post/domain/entities/get_post_parameters_model.dart';

abstract class PostEvents {}

class LoadPostEvent implements PostEvents {
  final PostParametersRequest parametersRequest;

  const LoadPostEvent(this.parametersRequest);
}
