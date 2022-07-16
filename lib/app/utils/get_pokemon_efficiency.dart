import 'package:pokedex_dev_challenge/app/helpers/values/pokemon_types_damage_relation.dart';
import 'package:pokedex_dev_challenge/app/models/types_efficiency.dart';

Map<String, double> getPokemonDamageRelation(List<String> types) {
  var typesJson = PokemonTypesDamageRelation.typesDamageRelation;

  List<TypesEfficiency> typesData = List<TypesEfficiency>.from(
    typesJson.map(
      (x) => TypesEfficiency.fromMap(x),
    ),
  );

  Map<String, double> damageRelation = {};

  for (var pokemonType in types) {
    for (var element in typesData) {
      if (pokemonType == element.type) {
        for (var damage in element.damageRelation) {
          if (damageRelation.containsKey(damage.type)) {
            damageRelation[damage.type] =
                damageRelation[damage.type]! * damage.damageFactor;
          } else {
            damageRelation[damage.type] = damage.damageFactor;
          }
        }
      }
    }
  }

  return damageRelation;
}

List<String> getPokemonWeaknesses(List<String> types) {
  var damageRelation = getPokemonDamageRelation(types);

  List<String> weaknesses = [];

  damageRelation.forEach((key, value) {
    if (value == 2) {
      weaknesses.add(key);
    }
  });

  return weaknesses;
}
