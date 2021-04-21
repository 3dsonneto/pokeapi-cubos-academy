import 'package:aula_api/api.dart';
import 'package:aula_api/pokemon.dart';

class PokeModel {
  Future<Pokemon> _pokemon;

  Future<Pokemon> get pokemon => _pokemon;

  fetchPokemon(int number) {
    //faz chamada pra api
    _pokemon = API().fetchPokemon(number);
  }
}
