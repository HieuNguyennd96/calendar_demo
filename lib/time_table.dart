class TimeTable {
  final int id;
  final String fromTime;
  final String endTime;
  final List<Classroom> classes;

  TimeTable({this.id, this.fromTime, this.endTime, this.classes});
}

class Classroom {}
