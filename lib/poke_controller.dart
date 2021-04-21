import 'dart:math';

import 'package:aula_api/poke_model.dart';
import 'package:aula_api/pokemon.dart';

class PokeController {
  final model = PokeModel();

  Future<Pokemon> get pokemon => model.pokemon;

  loadPokemon() {
    model.fetchPokemon(Random().nextInt(898));
  }
}
