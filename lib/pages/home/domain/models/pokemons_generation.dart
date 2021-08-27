class PokemonsGeneration {
  List<PokemonV2Pokemonspecies>? pokemonV2Pokemonspecies;

  PokemonsGeneration({this.pokemonV2Pokemonspecies});

  PokemonsGeneration.fromJson(Map<String, dynamic> json) {
    if (json['pokemon_v2_pokemonspecies'] != null) {
      List<PokemonV2Pokemonspecies> pokemonV2Pokemonspecies = [];
      json['pokemon_v2_pokemonspecies'].forEach((v) {
        pokemonV2Pokemonspecies.add(new PokemonV2Pokemonspecies.fromJson(v));
      });
      this.pokemonV2Pokemonspecies = pokemonV2Pokemonspecies;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemonV2Pokemonspecies != null) {
      data['pokemon_v2_pokemonspecies'] =
          this.pokemonV2Pokemonspecies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PokemonV2Pokemonspecies {
  String? name;
  int? id;
  List<PokemonV2Pokemons>? pokemonV2Pokemons;

  PokemonV2Pokemonspecies({this.name, this.id, this.pokemonV2Pokemons});

  PokemonV2Pokemonspecies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    if (json['pokemon_v2_pokemons'] != null) {
      List<PokemonV2Pokemons> pokemonV2Pokemons = [];
      json['pokemon_v2_pokemons'].forEach((v) {
        pokemonV2Pokemons.add(new PokemonV2Pokemons.fromJson(v));
      });
      this.pokemonV2Pokemons = pokemonV2Pokemons;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    if (this.pokemonV2Pokemons != null) {
      data['pokemon_v2_pokemons'] =
          this.pokemonV2Pokemons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PokemonV2Pokemons {
  List<PokemonV2Pokemontypes>? pokemonV2Pokemontypes;

  PokemonV2Pokemons({this.pokemonV2Pokemontypes});

  PokemonV2Pokemons.fromJson(Map<String, dynamic> json) {
    if (json['pokemon_v2_pokemontypes'] != null) {
      List<PokemonV2Pokemontypes> pokemonV2Pokemontypes = [];
      json['pokemon_v2_pokemontypes'].forEach((v) {
        pokemonV2Pokemontypes.add(new PokemonV2Pokemontypes.fromJson(v));
      });
      this.pokemonV2Pokemontypes = pokemonV2Pokemontypes;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemonV2Pokemontypes != null) {
      data['pokemon_v2_pokemontypes'] =
          this.pokemonV2Pokemontypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PokemonV2Pokemontypes {
  PokemonV2Type? pokemonV2Type;

  PokemonV2Pokemontypes({this.pokemonV2Type});

  PokemonV2Pokemontypes.fromJson(Map<String, dynamic> json) {
    pokemonV2Type = json['pokemon_v2_type'] != null
        ? new PokemonV2Type.fromJson(json['pokemon_v2_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemonV2Type != null) {
      data['pokemon_v2_type'] = this.pokemonV2Type!.toJson();
    }
    return data;
  }
}

class PokemonV2Type {
  String? name;

  PokemonV2Type({this.name});

  PokemonV2Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
