import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'RouteScreen.dart';

class SearchRoutes extends StatefulWidget {
  @override
  State<SearchRoutes> createState() => _SearchRoutesState();
}

class _SearchRoutesState extends State<SearchRoutes> {
  var selectedRoute = "Select your Bus Routes";
  late List<String> all_routes = [];
  // ignore: non_constant_identifier_names
  Future<void> ReadJson() async {
    final String jsondata1 =
        await rootBundle.loadString('lib/DATA/All_ROUTES.json');
    final list1 = json.decode(jsondata1);
    for (var element in list1) {
      all_routes.add(element["all_routes"]);
    }
  }

  @override
  void initState() {
    print("get list.");
    ReadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: MediaQuery.of(context).size.height * 0.54,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Image.asset(
                "assets/images/roadanim.gif",
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.32,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 190, 59),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
        Center(
          child: Card(
            elevation: 10,
            margin: const EdgeInsetsDirectional.only(top: 135),
            shadowColor: Colors.black,
            // surfaceTintColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: SizedBox(
              width: 300,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .663,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownSearch(
                    clearButtonProps: const ClearButtonProps(
                        padding: EdgeInsets.all(9),
                        constraints: BoxConstraints(maxWidth: double.infinity)),
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      baseStyle:
                          TextStyle(color: Colors.black, fontFamily: 'poppins'),
                      textAlignVertical: TextAlignVertical(y: 0.15),
                      dropdownSearchDecoration: InputDecoration(
                        isDense: true,
                        // isCollapsed: true,
                        border: InputBorder.none,
                      ),
                    ),
                    items: all_routes,
                    selectedItem: selectedRoute,
                    popupProps: PopupProps.dialog(
                      showSearchBox: true,
                      searchFieldProps: const TextFieldProps(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here...",
                          hintStyle: TextStyle(color: Colors.blue),
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      listViewProps: const ListViewProps(
                        padding: EdgeInsets.all(2),
                      ),
                      dialogProps: DialogProps(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        insetPadding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                      ),
                    ),
                    onChanged: (value) {
                      selectedRoute = value;
                      print(selectedRoute);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.7,
          left: MediaQuery.of(context).size.height * 0.15,
          child: Container(
            width: 150,
            height: 46,
            child: OutlinedButton(
              onPressed: (() {
                print(selectedRoute);
              }),
              // ignore: sort_child_properties_last
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Find Route',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Color.fromARGB(255, 255, 190, 59),
                      fontWeight: FontWeight.w800),
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
