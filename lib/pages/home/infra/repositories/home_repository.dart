import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_dev_challenge/core/services/api_config.dart';
import 'package:pokedex_dev_challenge/pages/home/domain/models/pokemons_generation.dart';

abstract class HomeRepository {
  Future<Either<Error, PokemonsGeneration>> getPokemonsByGeneration(
      int generationId);
}

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final ApiConfig _connect = GetIt.instance<ApiConfig>();

  @override
  Future<Either<Error, PokemonsGeneration>> getPokemonsByGeneration(
      int generationId) async {
    String pokemonByGenerationQuerry = """
    query pokeQuery(\$id:Int!){
      pokemon_v2_generation_by_pk(id: \$id) {
        pokemon_v2_pokemonspecies(order_by: {id: asc}) {
          name
          id
          pokemon_v2_pokemons {
            pokemon_v2_pokemontypes {
              pokemon_v2_type {
                name
              }
            }
          }
        }
      }
    }
    """;

    try {
      var response =
          await _connect.api.query(pokemonByGenerationQuerry, variables: {
        "id": generationId,
      });

      if (response["data"] == null) {
        throw new Error();
      }

      PokemonsGeneration pokemonsGeneration = PokemonsGeneration.fromMap(
        response["data"]["pokemon_v2_generation_by_pk"],
      );

      return Right(pokemonsGeneration);
    } catch (e) {
      print(e.toString());
      return Left(Error());
    }
  }
}
