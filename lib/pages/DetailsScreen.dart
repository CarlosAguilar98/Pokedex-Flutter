import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final heroTag;
  final dPokNom;
  final dNumPok;
  final dTipPok;
  final dPesPok;
  final dAltPok;
  final dImgPok;
  DetailsScreen(
      {Key? key,
      this.heroTag,
      this.dPokNom,
      this.dNumPok,
      this.dTipPok,
      this.dPesPok,
      this.dAltPok,
      this.dImgPok})
      : super(key: key);
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.dTipPok == "Grass"
          ? Colors.greenAccent
          : widget.dTipPok == "Fire"
              ? Colors.redAccent
              : widget.dTipPok == "Water"
                  ? Colors.blueAccent
                  : widget.dTipPok == "Ground"
                      ? Colors.brown.shade300
                      : widget.dTipPok == "Ice"
                          ? Colors.cyan
                          : widget.dTipPok == "Electric"
                              ? Colors.amber
                              : widget.dTipPok == "Bug"
                                  ? Colors.lightGreen
                                  : widget.dTipPok == "Dragon"
                                      ? Colors.orangeAccent
                                      : widget.dTipPok == "Psychic"
                                          ? Colors.pinkAccent
                                          : widget.dTipPok == "Fighting"
                                              ? Colors.limeAccent
                                              : widget.dTipPok == "Rock"
                                                  ? Colors.brown
                                                  : widget.dTipPok == "Poison"
                                                      ? Colors.purpleAccent
                                                      : Colors.grey.shade300,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _Flecha(),
          _Descripcion(),
          _NombreCodePokemon(),
          _TipoPokemonD(),
          _PokeballFondo(),
          Positioned(
              top: (heigth * 0.2),
              child: Hero(
                tag: widget.heroTag,
                child: CachedNetworkImage(
                  imageUrl: widget.dImgPok,
                  height: 250,
                  width: 250,
                  fit: BoxFit.fitHeight,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget _Flecha() {
    return Positioned(
        top: 40,
        left: 5,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }

  Widget _Descripcion() {
    var heigth = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Positioned(
        bottom: 0,
        child: Container(
          width: width,
          height: heigth * 0.6,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40))),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.3,
                      child: Text(
                        "Altura",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      child: Text(
                        widget.dAltPok.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.3,
                      child: Text(
                        "Peso",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      child: Text(
                        widget.dPesPok.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ));
  }

  Widget _NombreCodePokemon() {
    return Positioned(
        top: 90,
        left: 20,
        right: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.dPokNom.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "#" + widget.dNumPok.toString(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  Widget _TipoPokemonD() {
    return Positioned(
        top: 150,
        left: 25,
        child: Container(
          child: Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Text(
                widget.dTipPok.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Colors.blueGrey.withOpacity(0.7)),
        ));
  }

  Widget _PokeballFondo() {
    return Positioned(
      top: 175,
      right: 0,
      child: Image.asset('images/pokeball.png', fit: BoxFit.fitWidth),
      height: 220,
    );
  }
}
