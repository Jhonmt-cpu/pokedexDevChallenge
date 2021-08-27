import 'package:hasura_connect/hasura_connect.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_dev_challenge/core/values/pokeapi_url.dart';

@singleton
class ApiConfig {
  HasuraConnect get api => HasuraConnect(PokeapiUrl.url);
}
