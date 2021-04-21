import 'dart:convert';

import 'package:aula_api/pokemon.dart';
import 'package:http/http.dart' as http;

class API {
  Future<Pokemon> fetchPokemon(int number) async {
    final response =
        await http.get(Uri.https("pokeapi.co", "/api/v2/pokemon/$number"));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      print("Erro");
    }
  }
}
