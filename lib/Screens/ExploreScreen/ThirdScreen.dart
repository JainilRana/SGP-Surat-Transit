import 'dart:convert';
import 'dart:ffi';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:surat_transit/Model/exploredatadart.dart';
import 'package:surat_transit/Screens/ExploreScreen/detail_screen.dart';

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class CustomIcons {
  static const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");
  static const IconData option = IconData(0xe902, fontFamily: "CustomIcons");
}

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

late ExploreSurat a;

class _ExploreScreenState extends State<ExploreScreen> {
  List<ExploreSurat> s = [];
  Map<String, String> places = {};

  Future<void> readJson() async {
    final String data =
        await rootBundle.loadString("lib/DATA/exploredata.json");
    final redable = json.decode(data);
    for (var i in redable) {
      String name = i["name"];
      places[name] = i["data"];
    }
  }

  double currentPage = 1.0;

  Future<void> readExplore() async {
    var read1 = await rootBundle.loadString("lib/DATA/exploredata.json");
    List<dynamic> list1 = json.decode(read1);
    for (var element in list1) {
      var x = ExploreSurat.fromJson(element);
      s.add(x);
    }
  }

  @override
  void initState() {
    super.initState();
    print("Loading Json data!");

    readJson();
    print("Data loaded");
    readExplore();
    // print(places);
    currentPage = s.length - 1.0;
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: s.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.4),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 50,
                  width: 200,
                  child: const Card(
                    elevation: 20,
                    color: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                        child: Text(
                      "Explore SURAT!",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "assets/Exo_2",
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: SizedBox(
                        width: 370,
                        height: 550,
                        child: Positioned.fill(
                          child: ListView.builder(
                            itemCount: s.length,
                            controller: controller,
                            reverse: true,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  DetailScreen(s[index]))));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      child: Favourites(
                                        s[index].name as String,
                                        s[index].image as String,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Favourites extends StatelessWidget {
  String title;
  String imageUrl;
  Favourites(
    this.title,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 260,
            width: 350,
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              elevation: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 170,
            bottom: 15,
            child: Container(
              height: 11,
              width: 220,
              child: GlassContainer(
                blur: 2,
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
