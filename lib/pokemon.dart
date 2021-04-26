class Pokemon {
  String nome;
  String urlImage;
  int id;
  List<Ability> abilities;

  Pokemon.fromJson(Map<String, dynamic> json) {
    nome = json["name"];
    urlImage = json["sprites"]["other"]["official-artwork"]["front_default"];
    id = json["id"];

    var arrayAbilities = json["abilities"] as List;

    abilities = arrayAbilities.map((item) {
      print(item);
      return Ability.fromJson(item["ability"]);
    }).toList();
  }
}

class Ability {
  String name;
  String url;

  Ability.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
  }
}
