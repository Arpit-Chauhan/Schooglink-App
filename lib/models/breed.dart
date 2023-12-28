import 'dart:convert';

List<Breed> breedFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Breed>.from(jsonData.map((x) => Breed.fromJson(x as Map<String, dynamic>)));
}

String breedToJson(List<Breed> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Breed {
  Dimensions? weight;
  Dimensions? height;
  String? id;
  String? name;
  String? bredFor;
  String? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? origin;
  String? referenceImageId;
  String? countryCode;
  String? description;
  String? history;

  Breed({
    this.weight,
    this.height,
    this.id,
    this.name,
    this.bredFor,
    this.breedGroup,
    this.lifeSpan,
    this.temperament,
    this.origin,
    this.referenceImageId,
    this.countryCode,
    this.description,
    this.history,
  });

  factory Breed.fromJson(Map<String, dynamic>? json) {
    return Breed(
      weight: json != null ? Dimensions.fromJson(json['weight']) : null,
      height: json != null ? Dimensions.fromJson(json['height']) : null,
      id: json?['id']?.toString(),
      name: json?['name']?.toString(),
      bredFor: json?['bred_for']?.toString(),
      breedGroup: json?['breed_group']?.toString(),
      lifeSpan: json?['life_span']?.toString(),
      temperament: json?['temperament']?.toString(),
      origin: json?['origin']?.toString(),
      referenceImageId: json?['reference_image_id']?.toString(),
      countryCode: json?['country_code']?.toString(),
      description: json?['description']?.toString(),
      history: json?['history']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        "weight": weight?.toJson(),
        "height": height?.toJson(),
        "id": id ?? '',
        "name": name ?? '',
        "bred_for": bredFor ?? '',
        "breed_group": breedGroup ?? '',
        "life_span": lifeSpan ?? '',
        "temperament": temperament ?? '',
        "origin": origin ?? '',
        "reference_image_id": referenceImageId ?? '',
        "country_code": countryCode ?? '',
        "description": description ?? '',
        "history": history ?? '',
      };
}

class Dimensions {
  String? imperial;
  String? metric;

  Dimensions({
    this.imperial,
    this.metric,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        imperial: json["imperial"]?.toString(),
        metric: json["metric"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "imperial": imperial ?? '',
        "metric": metric ?? '',
      };
}
