import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class SelectedCard extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final list;
  var selected;
  SelectedCard(this.list, this.selected);
  @override
  State<SelectedCard> createState() => _SelectedCardState(list, selected);
}

class _SelectedCardState extends State<SelectedCard> {
  // ignore: prefer_typing_uninitialized_variables
  var stationsList;
  List<String> selected_Station;
  _SelectedCardState(this.stationsList, this.selected_Station);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 25,
                        child: Image.asset('assets/images/Animation.gif'),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .663,
                      child: DropdownSearch(
                        clearButtonProps: const ClearButtonProps(
                            padding: EdgeInsets.all(9),
                            constraints:
                                BoxConstraints(maxWidth: double.infinity)),
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          baseStyle: TextStyle(color: Colors.blue),
                          textAlignVertical: TextAlignVertical(y: 0.15),
                          dropdownSearchDecoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                        items: stationsList,
                        selectedItem: selected_Station[0],
                        popupProps: PopupProps.dialog(
                          showSearchBox: true,
                          searchFieldProps: const TextFieldProps(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter",
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
                            insetPadding: EdgeInsets.symmetric(
                                horizontal: 35, vertical: 30),
                          ),
                        ),
                        onChanged: (value) {
                          selected_Station[0] = value;
                          print(selected_Station[0]);
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 25,
                        child: Image.asset('assets/images/Animation-2.gif'),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .663,
                      child: DropdownSearch(
                        clearButtonProps: const ClearButtonProps(
                            padding: EdgeInsets.all(9),
                            constraints:
                                BoxConstraints(maxWidth: double.infinity)),
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          baseStyle: TextStyle(
                              color: Colors.blue,
                              fontFamily: 'poppins',
                              fontSize: 14),
                          textAlignVertical: TextAlignVertical(y: 0.15),
                          dropdownSearchDecoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                        items: stationsList,
                        selectedItem: selected_Station[1],
                        popupProps: PopupProps.dialog(
                          showSearchBox: true,
                          searchFieldProps: const TextFieldProps(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter",
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
                            insetPadding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 30),
                          ),
                        ),
                        onChanged: (value) {
                          selected_Station[1] = value;
                          print(selected_Station[1]);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
