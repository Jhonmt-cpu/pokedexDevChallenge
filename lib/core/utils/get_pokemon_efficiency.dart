import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:pokedex_dev_challenge/core/values/pokemon_types_damage_relation.dart';

Map<String, double> getPokemonDamageRalation(List<String> types) {
  var typesJson = PokemonTypesDamageRelation.typesDamageRelation;

  List<TypesEfficiency> typesData = List<TypesEfficiency>.from(
      typesJson.map((x) => TypesEfficiency.fromMap(x)));

  Map<String, double> damageRelation = {};

  types.forEach((pokemonType) {
    typesData.forEach((element) {
      if (pokemonType == element.type) {
        element.damageRelation.forEach((damage) {
          if (damageRelation.containsKey(damage.type)) {
            damageRelation[damage.type] =
                damageRelation[damage.type]! * damage.damageFactor;
          } else {
            damageRelation[damage.type] = damage.damageFactor;
          }
        });
      }
    });
  });

  return damageRelation;
}

List<String> getPokemonWeakenesses(List<String> types) {
  var damageRelation = getPokemonDamageRalation(types);

  List<String> weaknesses = [];

  damageRelation.forEach((key, value) {
    if (value == 2) {
      weaknesses.add(key);
    }
  });

  return weaknesses;
}
