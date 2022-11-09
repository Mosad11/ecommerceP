import 'package:ecommerce_p/view_models/auth_view_model.dart';
import 'package:ecommerce_p/view_models/explore_view_model.dart';
import 'package:ecommerce_p/view_models/explore_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ExploreViewmodel());
  }
}
