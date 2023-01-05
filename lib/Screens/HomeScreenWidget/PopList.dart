import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class PopList extends StatefulWidget {
  var p = [];
  var s = [];
  List<String> station;
  PopList(this.p, this.s, this.station);

  @override
  State<PopList> createState() => _PopListState(p, s, station);
}

class _PopListState extends State<PopList> {
  var pop;
  var selected_station;
  List<String> stations_all;
  _PopListState(this.pop, this.selected_station, this.stations_all);
  @override
  Widget build(BuildContext context) {
    print('build pop list');
    return pop[0]
        ? BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: MediaQuery.of(context).size.width * 0.010,
                sigmaY: MediaQuery.of(context).size.height * 0.010),
            child: SafeArea(
              child: Positioned(
                top: MediaQuery.of(context).size.height * 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: 50,
                      child: Column(
                        children: [
                          SearchField(
                            maxSuggestionsInViewPort: 6,
                            textInputAction: TextInputAction.done,
                            onSuggestionTap: ((p0) {
                              print(p0.searchKey);
                              if (pop[1]) {
                                selected_station[0] = p0.searchKey;
                              }
                              if (pop[2]) {
                                selected_station[1] = p0.searchKey;
                              }
                              setState(() {
                                pop[0] = !pop[0];
                                if (pop[1]) {
                                  pop[1] = pop[0];
                                }
                                if (pop[2]) {
                                  pop[2] = pop[0];
                                }
                              });
                            }),
                            suggestions: stations_all
                                .map(
                                  (e) => SearchFieldListItem(e),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : SizedBox();
  }
}
