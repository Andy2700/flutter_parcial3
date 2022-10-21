import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'bebidas.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   List listabebidas = [];

  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 18, 52, 81),
        appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        title: Center(
          child: Container(
            height: 90,
            width: ancho * 0.4,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("assets/img/imm.jpeg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)),
          ),
        )),
        body: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 20,
              child: Text(
                "BEBIDAS",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Positioned(
              top: 45,
              bottom: 0,
              width: ancho,
              child: Column(children: [
                SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: GestureDetector(
                              child: Column(
                            children: [
                              SizedBox(
                                width: ancho * 0.4,
                                height: 40,
                                child: const Text(
                                  "ANDY ERNESTO MARTINEZ MEJIA",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: ancho * 0.4,
                                height: 30,
                                child: const Text(
                                  "25-0064-2018",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(color: Colors.white)),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: GestureDetector(
                                child: Column(
                              children: [
                                SizedBox(
                                  width: ancho * 0.4,
                                  height: 40,
                                  child: const Text(
                                    " TATIANA ELIZABETH PEREZ REYES",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: ancho * 0.4,
                                  height: 30,
                                  child: const Text(
                                    "17-1703-2018",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ))),
                      ),
                    )
                  ],
                ),
              ),
                // ignore: unnecessary_null_comparison
                listabebidas.length != null
                    ? Expanded(
                        child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.5),
                        itemCount: listabebidas.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 8),
                              child: Container(
                                  // ignore: prefer_const_constructors
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Stack(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 20, top: 25),
                                      child: SizedBox(
                                          child: Text(
                                        listabebidas[index]['strDrink'],
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      )),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: CachedNetworkImage(
                                        imageUrl: listabebidas[index]['strDrinkThumb'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ])),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Bebidas(
                                          bebidasdetalle: listabebidas[index])));
                            },
                          );
                        },
                      ))
                    : const Center(
                        child: CircularProgressIndicator(),
                      )
              ]),
            ),
          ],
        ));

  }
        
    @override
  void initState() {
    super.initState();
    if (mounted) {
      bebidas();
    }
  }

  void bebidas() {
    var url = Uri.https('www.thecocktaildb.com', '/api/json/v1/1/search.php', {'s': 'margarita'});
    http.get(url).then((value) {
      print(value.statusCode);
      if (value.statusCode == 200) {
        var decodejsonData = jsonDecode(value.body);
        listabebidas = decodejsonData['drinks'];
        setState(() {});
      }
    });
  }
}