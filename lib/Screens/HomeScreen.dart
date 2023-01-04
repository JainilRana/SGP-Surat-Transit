import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:searchfield/searchfield.dart';
import 'package:surat_transit/DATA/ConvertToList.dart';

import 'package:surat_transit/Screens/CustomBottombar.dart';

class HomeScreen extends StatefulWidget {
  List<String> _stations;
  HomeScreen(this._stations);

  @override
  State<HomeScreen> createState() => _HomeScreenState(_stations);
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> stations_all;

  _HomeScreenState(this.stations_all);

  String selectedFrom = "Select Location..";
  String selectedTo = "To..";
  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

    print("build Home");
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        // ignore: prefer_const_literals_to_create_immutables

        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.08),
                  child: Image.asset('assets/images/Around_the_world.gif'),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Montserrat_Subrayada',
                        color: Color.fromRGBO(35, 138, 250, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Stack(alignment: AlignmentDirectional.topCenter, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.34,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(35, 138, 250, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          // DropdownButtonFormField(
                          //   elevation: 8,
                          //   isExpanded: true,
                          //   menuMaxHeight: 350,
                          //   borderRadius: BorderRadius.circular(10),
                          //   decoration: const InputDecoration(
                          //     prefixIcon: Icon(Icons.location_searching),
                          //     border: InputBorder.none,
                          //     hintText: 'From..',
                          //   ),
                          //   items: stations_all
                          //       .map((e) => DropdownMenuItem(
                          //             enabled: true,
                          //             value: e,
                          //             child: Text(
                          //               e,
                          //               maxLines: 2,
                          //               //textWidthBasis: TextWidthBasis.parent,
                          //               overflow: TextOverflow.visible,
                          //               style: Theme.of(context)
                          //                   .textTheme
                          //                   .bodyText1,
                          //             ),
                          //           ))
                          //       .toList(),
                          //   onChanged: ((value) {
                          //     print(value);
                          //     selectedFrom = value as String;
                          //   }),
                          // ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 25,
                                  child: Image.asset(
                                      'assets/images/Animation.gif'),
                                ),
                              ),
                              TextButton(
                                  onPressed: null, child: Text(selectedFrom)),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 25,
                                  child: Image.asset(
                                      'assets/images/Animation-2.gif'),
                                ),
                              ),
                              TextButton(
                                  onPressed: null, child: Text(selectedTo)),
                            ],
                          ),
                          // DropdownButtonFormField(
                          //   isExpanded: true,
                          //   menuMaxHeight: 350,
                          //   borderRadius: BorderRadius.circular(10),
                          //   decoration: const InputDecoration(
                          //       prefixIcon: Icon(Icons.location_on),
                          //       border: InputBorder.none,
                          //       hintText: "To.."),
                          //   items: stations_all
                          //       .map((e) => DropdownMenuItem(
                          //             enabled: true,
                          //             value: e,
                          //             child: Text(
                          //               e,
                          //               maxLines: 2,
                          //               //textWidthBasis: TextWidthBasis.parent,
                          //               overflow: TextOverflow.visible,
                          //               style: Theme.of(context)
                          //                   .textTheme
                          //                   .bodyText1,
                          //             ),
                          //           ))
                          //       .toList(),
                          //   onChanged: ((value) {
                          //     print(value);
                          //     selectedTo = value as String;
                          //   }),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                child: Container(
                  width: 150,
                  height: 46,
                  child: OutlinedButton(
                    onPressed: (() {
                      print(selectedFrom + " " + selectedTo);
                    }),
                    // ignore: sort_child_properties_last
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Find Route',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Color.fromRGBO(35, 138, 250, 1),
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
      bottomNavigationBar: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: const CustomBottom(),
      ),
    );
  }
}
