class RouteSteps {
  List<Map<String, dynamic>> getpoints(List<dynamic> steps) {
    List<Map<String, dynamic>> point = [];
    for (var element in steps) {
      point.add(element['start_location']);
      point.add(element['end_location']);
      if (element['travel_mode'] == 'TRANSIT') {
        point.add(element['transit_details']['arrival_stop']['location']);
        point.add(element['transit_details']['departure_stop']['location']);
      }
    }

    return point;
  }

  List<String> getinfo(List<dynamic> steps) {
    List<String> info = [];
    for (var element in steps) {
      info.add(element['html_instructions']);
    }
    return info;
  }
}
