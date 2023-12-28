import 'package:get/get.dart';
import 'package:schooglink/bindings/breed_list_binding.dart';
import 'package:schooglink/view/breed_list_screen.dart';

class AppRoutes {
  static const breedListScreen = '/breed_list_screen';

  static List<GetPage> pages = [
    GetPage(
      name: breedListScreen,
      page: () => BreedListScreen(),
      bindings: [
        BreedListBinding(),
      ],
    ),
  ];
}
