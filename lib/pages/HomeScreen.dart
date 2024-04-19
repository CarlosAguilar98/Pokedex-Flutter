import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter/controller/getDataController.dart';
import 'package:pokedex_flutter/pages/DetailsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final getDataController = Get.put(GetDataController());

  @override
  void initState() {
    getDataController.getDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Obx(
      () => Scaffold(
        backgroundColor: Color.fromARGB(255, 251, 255, 254),
        body: !getDataController.isLoading.value
            ? Stack(
                children: [
                  _ImagenFondo(),
                  _Titulo(),
                  Positioned(
                      top: 150,
                      bottom: 0,
                      width: width,
                      child: Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.4),
                                itemCount: 151,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    child: InkWell(
                                      child: SafeArea(
                                          child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            color: getDataController
                                                        .getDataModel
                                                        .value
                                                        .results[index]
                                                        .pokTipo ==
                                                    "Grass"
                                                ? Colors.greenAccent
                                                : getDataController
                                                            .getDataModel
                                                            .value
                                                            .results[index]
                                                            .pokTipo ==
                                                        "Fire"
                                                    ? Colors.redAccent
                                                    : getDataController
                                                                .getDataModel
                                                                .value
                                                                .results[index]
                                                                .pokTipo ==
                                                            "Water"
                                                        ? Colors.blueAccent
                                                        : getDataController
                                                                    .getDataModel
                                                                    .value
                                                                    .results[
                                                                        index]
                                                                    .pokTipo ==
                                                                "Poison"
                                                            ? Colors
                                                                .purpleAccent
                                                            : getDataController
                                                                        .getDataModel
                                                                        .value
                                                                        .results[index]
                                                                        .pokTipo ==
                                                                    "Electric"
                                                                ? Colors.amber
                                                                : getDataController.getDataModel.value.results[index].pokTipo == "Ice"
                                                                    ? Colors.cyanAccent
                                                                    : getDataController.getDataModel.value.results[index].pokTipo == "Dragon"
                                                                        ? Colors.orangeAccent
                                                                        : getDataController.getDataModel.value.results[index].pokTipo == "Rock"
                                                                            ? Colors.brown
                                                                            : getDataController.getDataModel.value.results[index].pokTipo == "Psychic"
                                                                                ? Colors.pinkAccent
                                                                                : getDataController.getDataModel.value.results[index].pokTipo == "Fighting"
                                                                                    ? Colors.limeAccent
                                                                                    : getDataController.getDataModel.value.results[index].pokTipo == "Bug"
                                                                                        ? Colors.lightGreen
                                                                                        : getDataController.getDataModel.value.results[index].pokTipo == "Ground"
                                                                                            ? Colors.brown.shade300
                                                                                            : Colors.grey.shade300),
                                        child: Stack(
                                          children: [
                                            _PokeballInterna(),
                                            _ImagenPokemon(index),
                                            _NombrePokemon(index),
                                            _TipoPokemon(index)
                                          ],
                                        ),
                                      )),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => DetailsScreen(
                                                      heroTag: index,
                                                      dPokNom: getDataController
                                                          .getDataModel
                                                          .value
                                                          .results[index]
                                                          .pokNom,
                                                      dAltPok: getDataController
                                                          .getDataModel
                                                          .value
                                                          .results[index]
                                                          .pokAltura,
                                                      dPesPok: getDataController
                                                          .getDataModel
                                                          .value
                                                          .results[index]
                                                          .pokPeso,
                                                      dNumPok: getDataController
                                                          .getDataModel
                                                          .value
                                                          .results[index]
                                                          .pokId,
                                                      dTipPok: getDataController
                                                          .getDataModel
                                                          .value
                                                          .results[index]
                                                          .pokTipo,
                                                      dImgPok: getDataController
                                                          .getDataModel
                                                          .value
                                                          .results[index]
                                                          .pokImg,
                                                    )));
                                      },
                                    ),
                                  );
                                }),
                          )
                        ],
                      ))
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _ImagenFondo() {
    return Positioned(
        top: -100,
        right: -90,
        child: Image.asset('images/pokeball.png',
            fit: BoxFit.fitWidth, width: 300));
  }

  Widget _Titulo() {
    return Positioned(
        top: 100,
        left: 20,
        child: Text(
          'pokeTLTC',
          style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ));
  }

  Widget _PokeballInterna() {
    return Positioned(
      bottom: 5,
      right: 5,
      child: Image.asset('images/pokeball.png', fit: BoxFit.fitWidth),
      height: 100,
    );
  }

  Widget _ImagenPokemon(index) {
    return Positioned(
        bottom: 5,
        right: 5,
        child: Hero(
          tag: index,
          child: CachedNetworkImage(
            imageUrl:
                getDataController.getDataModel.value.results[index].pokImg,
            height: 80,
            fit: BoxFit.fitHeight,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ));
  }

  Widget _NombrePokemon(index) {
    return Positioned(
        top: 30,
        left: 15,
        child: Text(
          getDataController.getDataModel.value.results[index].pokNom,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ));
  }

  Widget _TipoPokemon(index) {
    return Positioned(
        top: 60,
        left: 15,
        child: Container(
          child: Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Text(
                getDataController.getDataModel.value.results[index].pokTipo,
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
}
