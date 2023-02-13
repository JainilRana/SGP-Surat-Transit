import 'package:flutter/material.dart';

class RouteScreen extends StatefulWidget {
  var selected;
  List pr;
  RouteScreen(this.selected, this.pr, {super.key});
  @override
  State<RouteScreen> createState() => _RouteScreenState(selected, pr);
}

class _RouteScreenState extends State<RouteScreen> {
  var selected_stations;
  List avRoute;
  _RouteScreenState(this.selected_stations, this.avRoute);
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
                        padding: const EdgeInsets.all(8),
                        child: avRoute[0] != "No"
                            ? ListView.separated(
                                // scrollDirection: Axis.vertical,
                                // shrinkWrap: true,
                                controller: scrollController,
                                itemBuilder: ((context, index) {
                                  print(index);
                                  return StationInfo(
                                      avRoute: avRoute, index: index);
                                }),
                                itemCount: avRoute.length,
                                separatorBuilder: (__, _) => const Divider(),
                              )
                            : const Center(
                                child: Text('No Such Route Available'),
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

class StationInfo extends StatelessWidget {
  const StationInfo({
    Key? key,
    required this.avRoute,
    required this.index,
  }) : super(key: key);

  final List avRoute;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            '${avRoute[index].between_Stations}'
                .replaceAll(',', ' ➡️ ')
                .replaceAll('[', '')
                .replaceAll(']', '')
                .replaceAll('travel', '\n...travel..\n'),
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        ListTile(
          title: Text(
            'Platfrom No.\n${avRoute[index].pt_no} ${avRoute[index].time}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
