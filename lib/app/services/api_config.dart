import 'package:hasura_connect/hasura_connect.dart';
import 'package:pokedex_dev_challenge/app/helpers/values/strings.dart';

class ApiConfig {
  HasuraConnect get api => HasuraConnect(Strings.pokeApiUrl);
}
