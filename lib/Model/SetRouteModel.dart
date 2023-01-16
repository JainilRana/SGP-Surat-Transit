class SetRouteModel {
  final String selected;
  final List<String> routes;
  final String platNo;
  final String totaltime;

  SetRouteModel(this.selected, this.routes, this.platNo, this.totaltime);
  @override
  String toString() {
    // TODO: implement toString
    return selected + " " + platNo + " " + totaltime + "\n" + routes.toString();
  }
}
