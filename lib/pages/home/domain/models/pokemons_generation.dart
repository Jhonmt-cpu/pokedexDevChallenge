import 'dart:convert';

import 'package:equatable/equatable.dart';

class PokemonsGeneration extends Equatable {
  final List<PokemonV2Pokemonspecies> pokemonV2Pokemonspecies;

  PokemonsGeneration({required this.pokemonV2Pokemonspecies});

  @override
  List<Object?> get props => [pokemonV2Pokemonspecies];

  Map<String, dynamic> toMap() {
    return {
      'pokemon_v2_pokemonspecies':
          pokemonV2Pokemonspecies.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonsGeneration.fromMap(Map<String, dynamic> map) {
    return PokemonsGeneration(
      pokemonV2Pokemonspecies: List<PokemonV2Pokemonspecies>.from(
          map['pokemon_v2_pokemonspecies']
              ?.map((x) => PokemonV2Pokemonspecies.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonsGeneration.fromJson(String source) =>
      PokemonsGeneration.fromMap(json.decode(source));
}

class PokemonV2Pokemonspecies extends Equatable {
  final String name;
  final int id;
  final List<PokemonV2Pokemons> pokemonV2Pokemons;

  PokemonV2Pokemonspecies({
    required this.name,
    required this.id,
    required this.pokemonV2Pokemons,
  });

  @override
  List<Object?> get props => [name, id, pokemonV2Pokemons];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'pokemon_v2_pokemons': pokemonV2Pokemons.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonV2Pokemonspecies.fromMap(Map<String, dynamic> map) {
    return PokemonV2Pokemonspecies(
      name: map['name'],
      id: map['id'],
      pokemonV2Pokemons: List<PokemonV2Pokemons>.from(
          map['pokemon_v2_pokemons']?.map((x) => PokemonV2Pokemons.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonV2Pokemonspecies.fromJson(String source) =>
      PokemonV2Pokemonspecies.fromMap(json.decode(source));

  PokemonV2Pokemonspecies copyWith({
    String? name,
    int? id,
    List<PokemonV2Pokemons>? pokemonV2Pokemons,
  }) {
    return PokemonV2Pokemonspecies(
      name: name ?? this.name,
      id: id ?? this.id,
      pokemonV2Pokemons: pokemonV2Pokemons ?? this.pokemonV2Pokemons,
    );
  }
}

class PokemonV2Pokemons extends Equatable {
  final List<PokemonV2Pokemontypes> pokemonV2Pokemontypes;

  PokemonV2Pokemons({required this.pokemonV2Pokemontypes});

  @override
  List<Object?> get props => [pokemonV2Pokemontypes];

  Map<String, dynamic> toMap() {
    return {
      'pokemon_v2_pokemontypes':
          pokemonV2Pokemontypes.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonV2Pokemons.fromMap(Map<String, dynamic> map) {
    return PokemonV2Pokemons(
      pokemonV2Pokemontypes: List<PokemonV2Pokemontypes>.from(
          map['pokemon_v2_pokemontypes']
              ?.map((x) => PokemonV2Pokemontypes.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonV2Pokemons.fromJson(String source) =>
      PokemonV2Pokemons.fromMap(json.decode(source));
}

class PokemonV2Pokemontypes extends Equatable {
  final PokemonV2Type pokemonV2Type;

  PokemonV2Pokemontypes({required this.pokemonV2Type});

  @override
  List<Object?> get props => [pokemonV2Type];

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

class PokemonV2Type extends Equatable {
  final String name;

  PokemonV2Type({required this.name});

  @override
  List<Object?> get props => [name];

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

  factory PokemonV2Type.fromJson(String source) =>
      PokemonV2Type.fromMap(json.decode(source));
}
