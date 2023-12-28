import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../viewmodels/breed_list_controller.dart';

class BreedListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BreedListController());
  }
}
