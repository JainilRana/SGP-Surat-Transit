import 'dart:ffi';

class RouteModel {
  final int pt_no;
  final double time;
  final double distance;
  final List<String> between_Stations;
  RouteModel(
    this.pt_no,
    this.time,
    this.distance,
    this.between_Stations,
  );
}
