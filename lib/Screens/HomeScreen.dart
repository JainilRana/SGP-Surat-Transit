import 'package:flutter/material.dart';

import 'package:surat_transit/Screens/HomeScreenWidget/CustomBottombar.dart';

import 'package:surat_transit/Screens/HomeScreenWidget/SelectCard.dart';

class HomeScreen extends StatefulWidget {
  List<String> _stations;
  HomeScreen(this._stations);

  @override
  State<HomeScreen> createState() => _HomeScreenState(_stations);
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> stations_all;

  _HomeScreenState(this.stations_all);

  var selected_Station = ["Select Location..", "To.."];

  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

    print("build Home");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        Column(
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
                    children: const [
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
              child:
                  Stack(alignment: AlignmentDirectional.topCenter, children: [
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
                SelectedCard(stations_all, selected_Station),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.25,
                  child: Container(
                    width: 150,
                    height: 46,
                    child: OutlinedButton(
                      onPressed: (() {
                        print(selected_Station[0] + " " + selected_Station[1]);
                      }),
                      // ignore: sort_child_properties_last
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Find Route',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
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
      ]),
      bottomNavigationBar: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: const CustomBottom(),
      ),
    );
  }
}



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