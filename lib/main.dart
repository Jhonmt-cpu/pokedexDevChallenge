import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_dev_challenge/core/core.dart';

import 'main.config.dart';

void main() {
  runApp(AppWidget());
}

final getIt = GetIt.instance;

@injectableInit
GetIt configureDependecies() => $initGetIt(getIt);
