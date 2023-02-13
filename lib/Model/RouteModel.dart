class RouteModel {
  final int pt_no;
  final String time;
  final String startendroute;
  final double distance;
  final List<String> between_Stations;

  RouteModel({
    required this.pt_no,
    required this.time,
    required this.distance,
    required this.between_Stations,
    required this.startendroute,
  });
}
