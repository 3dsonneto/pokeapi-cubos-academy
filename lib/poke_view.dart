import 'package:aula_api/poke_controller.dart';
import 'package:aula_api/pokemon.dart';
import 'package:flutter/material.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<Pokemon>(
              future: controller.pokemon,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasData) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          child: Image.network(
                            snapshot.data.urlImage,
                            height: 300,
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              color: Colors.white),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            snapshot.data.nome.toUpperCase(),
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    snapshot.error,
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  );
                }
                return Container();
              }),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              setState(() {
                controller.loadPokemon();
              });
            },
            child: Text(
              "Load Pokémon",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
