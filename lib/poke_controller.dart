import 'package:aula_api/poke_model.dart';
import 'package:aula_api/pokemon.dart';

class PokeController {
  final model = PokeModel();
  int number = 1;

  Future<Pokemon> get pokemon => model.pokemon;

  loadPokemon() {
    model.fetchPokemon(number++);
  }
}
