import 'dart:convert';

class TypesEfficiency {
  String type;
  List<DamageRelation> damageRelation;

  TypesEfficiency({required this.type, required this.damageRelation});

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'damage_relation': damageRelation.map((x) => x.toMap()).toList(),
    };
  }

  factory TypesEfficiency.fromMap(Map<String, dynamic> map) {
    return TypesEfficiency(
      type: map['type'],
      damageRelation: List<DamageRelation>.from(
          map['damage_relation']?.map((x) => DamageRelation.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TypesEfficiency.fromJson(String source) =>
      TypesEfficiency.fromMap(json.decode(source));
}

class DamageRelation {
  double damageFactor;
  String type;

  DamageRelation({required this.damageFactor, required this.type});

  Map<String, dynamic> toMap() {
    return {
      'damage_factor': damageFactor,
      'type': type,
    };
  }

  factory DamageRelation.fromMap(Map<String, dynamic> map) {
    return DamageRelation(
      damageFactor: map['damage_factor'].toDouble(),
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DamageRelation.fromJson(String source) =>
      DamageRelation.fromMap(json.decode(source));
}
