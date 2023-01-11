import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:surat_transit/Screens/HomeScreenWidget/SelectCard.dart';

import '../RouteScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  // ignore: no_logic_in_create_state
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomindex = 0;
  late List<String> stations = [];

  Future<void> ReadJson() async {
    final String jsondata =
        await rootBundle.loadString('lib/DATA/All_Stations-2.json');
    final list = json.decode(jsondata);

    for (var element in list) {
      stations.add(element["all_station"]);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    print('build Station list.');
    ReadJson();
    super.initState();
  }

  var selected_Station = ["Select Location..", "To.."];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

    print("build Home");
    return Stack(children: [
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
              SelectedCard(stations, selected_Station),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                child: Container(
                  width: 150,
                  height: 46,
                  child: OutlinedButton(
                    onPressed: (() {
                      print(selected_Station[0] + " " + selected_Station[1]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RouteScreen(selected_Station),
                        ),
                      );
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
    ]);
  }
}
