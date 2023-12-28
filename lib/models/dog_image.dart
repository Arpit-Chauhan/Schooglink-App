import 'dart:convert';

DogImage dogImageFromJson(String str) => DogImage.fromJson(json.decode(str));

String dogImageToJson(DogImage data) => json.encode(data.toJson());

class DogImage {
  String? id;
  String? url;
  List<DogBreed>? breeds;
  String? width;
  String? height;

  DogImage({
    this.id,
    this.url,
    this.breeds,
    this.width,
    this.height,
  });

  factory DogImage.fromJson(Map<String, dynamic> json) => DogImage(
        id: json?["id"]?.toString(),
        url: json?["url"]?.toString(),
        breeds: json != null ? List<DogBreed>.from(json["breeds"].map((x) => DogBreed.fromJson(x))) : null,
        width: json?["width"]?.toString(),
        height: json?["height"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? '',
        "url": url ?? '',
        "breeds": List<dynamic>.from(breeds!.map((x) => x.toJson())) ?? null,
        "width": width ?? '',
        "height": height ?? '',
      };
}

class DogBreed {
  Dimensions? weight;
  Dimensions? height;
  String? id;
  String? name;
  String? bredFor;
  String? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? referenceImageId;

  DogBreed({
    this.weight,
    this.height,
    this.id,
    this.name,
    this.bredFor,
    this.breedGroup,
    this.lifeSpan,
    this.temperament,
    this.referenceImageId,
  });

  factory DogBreed.fromJson(Map<String, dynamic> json) => DogBreed(
        weight: json != null ? Dimensions.fromJson(json["weight"]) : null,
        height: json != null ? Dimensions.fromJson(json["height"]) : null,
        id: json?["id"]?.toString(),
        name: json?["name"]?.toString(),
        bredFor: json?["bred_for"]?.toString(),
        breedGroup: json?["breed_group"]?.toString(),
        lifeSpan: json?["life_span"]?.toString(),
        temperament: json?["temperament"]?.toString(),
        referenceImageId: json?["reference_image_id"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "weight": weight?.toJson(),
        "height": height?.toJson(),
        "id": id ?? '',
        "name": name ?? '',
        "bred_for": bredFor ?? '',
        "breed_group": breedGroup ?? '',
        "life_span": lifeSpan ?? '',
        "temperament": temperament ?? '',
        "reference_image_id": referenceImageId ?? '',
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
        imperial: json?["imperial"]?.toString(),
        metric: json?["metric"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "imperial": imperial ?? '',
        "metric": metric ?? '',
      };
}
