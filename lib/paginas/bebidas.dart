import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Bebidas extends StatefulWidget {
  final bebidasdetalle;

  const Bebidas({super.key, required this.bebidasdetalle});
  @override
  State<Bebidas> createState() => _BebidasState();
}

class _BebidasState extends State<Bebidas> {
  @override
  Widget build(BuildContext context) {
    
    var anchodeta = MediaQuery.of(context).size.width;
    var altodeta = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: (altodeta * 0.01) - 10,
            child: CachedNetworkImage(
              width: anchodeta,
              imageUrl: widget.bebidasdetalle['strDrinkThumb'],
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: 40,
            left: 1,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                  color: Colors.black45),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 20,
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.black45),
                    width: 370,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 4.0, bottom: 4.0),
                  child: Text(
                    widget.bebidasdetalle['strGlass'],
                    maxLines: 5,
                    style: const TextStyle(color: Colors.white),
                  ),
                )),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: anchodeta,
              height: altodeta * 0.6,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: anchodeta * 0.3,
                                  child: const Text(
                                    "Nombre :",
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 16),
                                  )),
                              SizedBox(
                                  width: anchodeta * 0.5,
                                  child: Text(
                                    widget.bebidasdetalle['strDrink'],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: anchodeta * 0.3,
                                  child: const Text(
                                    "Puntuación :",
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 16),
                                  )),
                              SizedBox(
                                  width: anchodeta * 0.3,
                                  child: Text(
                                    widget.bebidasdetalle['strIngredient2'].toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: anchodeta * 0.3,
                                  child: const Text(
                                    "Episodios :",
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 16),
                                  )),
                              SizedBox(
                                  width: anchodeta * 0.3,
                                  child: Text(
                                    widget.bebidasdetalle['strAlcoholic'].toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: anchodeta * 0.3,
                                  child: const Text(
                                    "Puesto :",
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 16),
                                  )),
                              // SizedBox(
                              //     width: anchodeta * 0.3,
                              //     child: Text(
                              //       widget.bebidasdetalle['rank'].toString(),
                              //       style: const TextStyle(
                              //           color: Colors.black,
                              //           fontSize: 20,
                              //           fontWeight: FontWeight.bold),
                              //     )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: anchodeta * 0.3,
                                  child: const Text(
                                    "Estado :",
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 16),
                                  )),
                              SizedBox(
                                  width: anchodeta * 0.5,
                                  child: Text(
                                    widget.bebidasdetalle['strAlcoholic'].toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ]),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );

    

  }
}