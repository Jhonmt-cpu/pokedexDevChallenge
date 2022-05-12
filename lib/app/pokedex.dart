import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pokedex_dev_challenge/app/components/dismiss_keyboard.dart';
import 'package:pokedex_dev_challenge/app/helpers/styles/app_colors.dart';
import 'package:pokedex_dev_challenge/app/routes/app_pages.dart';

class Pokedex extends StatelessWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mySystemTheme = const SystemUiOverlayStyle().copyWith(
      systemNavigationBarColor: AppColors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );

    return DismissKeyboard(
      child: GetMaterialApp(
        title: 'Pokedex',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.HOME,
        getPages: AppPages.routes,
      ),
    );
  }
}
