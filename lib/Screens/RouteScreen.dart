import 'package:flutter/material.dart';

class RouteScreen extends StatefulWidget {
  var selected;
  RouteScreen(this.selected);
  @override
  State<RouteScreen> createState() => _RouteScreenState(selected);
}

class _RouteScreenState extends State<RouteScreen> {
  var selected_stations;
  _RouteScreenState(this.selected_stations);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text(
              '${selected_stations[0]} 🔜 ${selected_stations[1]}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.16,
              maxChildSize: 0.8,
              builder: ((context, scrollController) => Card(
                    elevation: 10,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: ListView.separated(
                          // scrollDirection: Axis.vertical,
                          // shrinkWrap: true,
                          controller: scrollController,
                          itemBuilder: ((context, index) {
                            return ListTile(
                              title: Text(
                                '${selected_stations[0]} 🔜 ${selected_stations[1]}',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            );
                          }),
                          itemCount: 15,
                          separatorBuilder: (__, _) => const Divider(),
                        ),
                      ),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
