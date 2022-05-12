import 'package:get/get.dart';
import 'package:pokedex_dev_challenge/app/services/api_config.dart';
import 'package:pokedex_dev_challenge/ui/home/controller/home_controller.dart';
import 'package:pokedex_dev_challenge/ui/home/repositories/home_repository.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ApiConfig>(ApiConfig());
    Get.put<HomeRepository>(HomeRepositoryImpl());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
