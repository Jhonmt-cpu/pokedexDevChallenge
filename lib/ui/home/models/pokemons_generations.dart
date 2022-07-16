import 'dart:convert';

import 'package:pokedex_dev_challenge/app/utils/get_pokemon_efficiency.dart';

class PokemonsGeneration {
  final List<PokemonV2Pokemonspecies> pokemonV2Pokemonspecies;

  PokemonsGeneration({required this.pokemonV2Pokemonspecies});

  Map<String, dynamic> toMap() {
    return {
      'pokemon_v2_pokemonspecies': pokemonV2Pokemonspecies.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonsGeneration.fromMap(Map<String, dynamic> map) {
    return PokemonsGeneration(
      pokemonV2Pokemonspecies: List<PokemonV2Pokemonspecies>.from(
          map['pokemon_v2_pokemonspecies']?.map((x) => PokemonV2Pokemonspecies.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonsGeneration.fromJson(String source) =>
      PokemonsGeneration.fromMap(json.decode(source));
}

class PokemonV2Pokemonspecies {
  final String name;
  final int id;
  final List<PokemonV2Pokemons> pokemonV2Pokemons;
  final PokemonEvolutionChain? pokemonEvolutionChain;

  late final List<String> weaknesses;

  PokemonV2Pokemonspecies({
    required this.name,
    required this.id,
    required this.pokemonV2Pokemons,
    this.pokemonEvolutionChain,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'pokemon_v2_pokemons': pokemonV2Pokemons.map((x) => x.toMap()).toList(),
      'pokemon_v2_evolutionchain': pokemonEvolutionChain?.toMap(),
    };
  }

  factory PokemonV2Pokemonspecies.fromMap(Map<String, dynamic> map) {
    var pokemon = PokemonV2Pokemonspecies(
      name: map['name'],
      id: map['id'],
      pokemonV2Pokemons: List<PokemonV2Pokemons>.from(
          map['pokemon_v2_pokemons']?.map((x) => PokemonV2Pokemons.fromMap(x))),
      pokemonEvolutionChain: map["pokemon_v2_evolutionchain"] != null
          ? PokemonEvolutionChain.fromMap(
              map["pokemon_v2_evolutionchain"],
            )
          : null,
    );
    pokemon.weaknesses = getPokemonWeaknesses(
      pokemon.pokemonV2Pokemons[0].pokemonV2Pokemontypes.map((e) => e.pokemonV2Type.name).toList(),
    );
    return pokemon;
  }

  String toJson() => json.encode(toMap());

  factory PokemonV2Pokemonspecies.fromJson(String source) =>
      PokemonV2Pokemonspecies.fromMap(json.decode(source));
}

class PokemonV2Pokemons {
  final int height;
  final int weight;
  final List<PokemonV2Pokemontypes> pokemonV2Pokemontypes;

  PokemonV2Pokemons({
    required this.pokemonV2Pokemontypes,
    required this.height,
    required this.weight,
  });

  Map<String, dynamic> toMap() {
    return {
      'height': height,
      'weight': weight,
      'pokemon_v2_pokemontypes': pokemonV2Pokemontypes.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonV2Pokemons.fromMap(Map<String, dynamic> map) {
    return PokemonV2Pokemons(
      height: map['height'],
      weight: map['weight'],
      pokemonV2Pokemontypes: List<PokemonV2Pokemontypes>.from(
          map['pokemon_v2_pokemontypes']?.map((x) => PokemonV2Pokemontypes.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonV2Pokemons.fromJson(String source) =>
      PokemonV2Pokemons.fromMap(json.decode(source));
}

class PokemonV2Pokemontypes {
  final PokemonV2Type pokemonV2Type;

  PokemonV2Pokemontypes({required this.pokemonV2Type});

  Map<String, dynamic> toMap() {
    return {
      'pokemon_v2_type': pokemonV2Type.toMap(),
    };
  }

  factory PokemonV2Pokemontypes.fromMap(Map<String, dynamic> map) {
    return PokemonV2Pokemontypes(
      pokemonV2Type: PokemonV2Type.fromMap(map['pokemon_v2_type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonV2Pokemontypes.fromJson(String source) =>
      PokemonV2Pokemontypes.fromMap(json.decode(source));
}

class PokemonV2Type {
  final String name;

  PokemonV2Type({required this.name});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory PokemonV2Type.fromMap(Map<String, dynamic> map) {
    return PokemonV2Type(
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonV2Type.fromJson(String source) => PokemonV2Type.fromMap(json.decode(source));
}

class PokemonEvolutionChain {
  final List<PokemonSpecieEvolution> pokemonSpeciesEvolution;

  PokemonEvolutionChain({required this.pokemonSpeciesEvolution});

  Map<String, dynamic> toMap() {
    return {
      'pokemon_v2_pokemonspecies': pokemonSpeciesEvolution.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonEvolutionChain.fromMap(Map<String, dynamic> map) {
    return PokemonEvolutionChain(
      pokemonSpeciesEvolution: List<PokemonSpecieEvolution>.from(
          map['pokemon_v2_pokemonspecies']?.map((x) => PokemonSpecieEvolution.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonEvolutionChain.fromJson(String source) =>
      PokemonEvolutionChain.fromMap(json.decode(source));
}

class PokemonSpecieEvolution {
  final int id;
  final String name;
  final PokemonPreviusEvolution? pokemonPreviusEvolution;
  final int? evolvesFromSpeciesId;
  final List<PokemonEvolution>? pokemonV2Pokemonevolutions;

  PokemonSpecieEvolution({
    required this.id,
    required this.pokemonV2Pokemonevolutions,
    required this.evolvesFromSpeciesId,
    required this.name,
    required this.pokemonPreviusEvolution,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'evolves_from_species_id': evolvesFromSpeciesId,
      'pokemon_v2_pokemonevolutions': pokemonV2Pokemonevolutions?.map((x) => x.toMap()).toList(),
      'pokemon_v2_pokemonspecy': pokemonPreviusEvolution,
    };
  }

  factory PokemonSpecieEvolution.fromMap(Map<String, dynamic> map) {
    return PokemonSpecieEvolution(
      id: map['id'],
      name: map['name'],
      pokemonPreviusEvolution: map['pokemon_v2_pokemonspecy'] != null
          ? PokemonPreviusEvolution.fromMap(map['pokemon_v2_pokemonspecy'])
          : null,
      evolvesFromSpeciesId: map['evolves_from_species_id'],
      pokemonV2Pokemonevolutions: List<PokemonEvolution>.from(
          map['pokemon_v2_pokemonevolutions']?.map((x) => PokemonEvolution.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonSpecieEvolution.fromJson(String source) =>
      PokemonSpecieEvolution.fromMap(json.decode(source));
}

class PokemonPreviusEvolution {
  final String name;

  PokemonPreviusEvolution({required this.name});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory PokemonPreviusEvolution.fromMap(Map<String, dynamic> map) {
    return PokemonPreviusEvolution(
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonPreviusEvolution.fromJson(String source) =>
      PokemonPreviusEvolution.fromMap(json.decode(source));
}

class PokemonEvolution {
  final int? minLevel;

  PokemonEvolution({
    required this.minLevel,
  });

  Map<String, dynamic> toMap() {
    return {
      'minLevel': minLevel,
    };
  }

  factory PokemonEvolution.fromMap(Map<String, dynamic> map) {
    return PokemonEvolution(
      minLevel: map['minLevel'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonEvolution.fromJson(String source) => PokemonEvolution.fromMap(json.decode(source));
}
