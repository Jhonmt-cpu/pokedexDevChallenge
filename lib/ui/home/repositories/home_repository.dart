import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pokedex_dev_challenge/app/services/api_config.dart';
import 'package:pokedex_dev_challenge/ui/home/models/pokemons_generations.dart';

abstract class HomeRepository {
  Future<Either<Error, PokemonsGeneration>> getPokemonsByGeneration(
    int generationId,
  );
}

class HomeRepositoryImpl implements HomeRepository {
  final ApiConfig _connect = Get.find<ApiConfig>();

  @override
  Future<Either<Error, PokemonsGeneration>> getPokemonsByGeneration(int generationId) async {
    String pokemonByGenerationQuerry = """
    query pokeQuery(\$id:Int!){
      pokemon_v2_generation_by_pk(id: \$id) {
        pokemon_v2_pokemonspecies(order_by: {id: asc}) {
          name
          id
          pokemon_v2_pokemons {
            height
            weight
            pokemon_v2_pokemontypes {
              pokemon_v2_type {
                name
              }
            }
          }
          pokemon_v2_evolutionchain {
            pokemon_v2_pokemonspecies {
              id
              name
              evolves_from_species_id
              pokemon_v2_pokemonevolutions {
                min_level
              }
              pokemon_v2_pokemonspecy {
                name
              }
            }
          }
        }
      }
    }
    """;

    try {
      var response = await _connect.api.query(pokemonByGenerationQuerry, variables: {
        "id": generationId,
      });

      if (response["data"] == null) {
        throw Error();
      }

      PokemonsGeneration pokemonsGeneration = PokemonsGeneration.fromMap(
        response["data"]["pokemon_v2_generation_by_pk"],
      );

      return Right(pokemonsGeneration);
    } catch (e) {
      print(e);
      return Left(Error());
    }
  }
}
