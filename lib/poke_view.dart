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
      color: Color(0xFF292629),
      child: Column(
        children: [
          FutureBuilder<Pokemon>(
              future: controller.pokemon,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 50,
                    alignment: Alignment.center,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 0, right: 0, left: 0),
                          height: 230,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 30, left: 20),
                                child: Text(
                                  "#${snapshot.data.id}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20,
                                    left: (MediaQuery.of(context).size.width /
                                        4)),
                                child: Image.network(
                                  snapshot.data.urlImage,
                                  width: 200,
                                  height: 200,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            snapshot.data.nome.toUpperCase(),
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 100,
                          margin: EdgeInsets.only(bottom: 20),
                          alignment: Alignment.center,
                          child: ListView.builder(
                            itemCount: snapshot.data.abilities.length,
                            itemBuilder: (context, index) {
                              return Abilities(snapshot.data.abilities, index);
                            },
                          ),
                        )
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    snapshot.error,
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  );
                }
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

class Abilities extends StatelessWidget {
  final List abilitesList;
  final int index;

  Abilities(this.abilitesList, this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${abilitesList[index].name.toString().toUpperCase()}",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }
}
