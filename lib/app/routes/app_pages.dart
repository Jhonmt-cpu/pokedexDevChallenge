import 'package:get/get.dart';
import 'package:pokedex_dev_challenge/ui/home/binding/home_bindings.dart';
import 'package:pokedex_dev_challenge/ui/home/view/home_page.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBindings(),
    )
  ];
}
