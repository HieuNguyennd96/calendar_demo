import 'package:calendar_demo/date_time_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class ListReservationsView extends StatefulWidget {
  DateTime currentDate;

  ListReservationsView({@required this.currentDate});

  @override
  _ListReservationsViewState createState() => _ListReservationsViewState();
}

class _ListReservationsViewState extends State<ListReservationsView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Reservation View"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () => {
                  this.setState(() {
                    widget.currentDate = widget.currentDate.previousDay();                    
                  })
                },
                iconSize: 30.0,
                color: Colors.grey,
              ),
              Expanded(
                child: Center(
                  child:
                      Text(DateFormat("yyyy-MM-dd").format(widget.currentDate)),
                ),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () => {
                  this.setState(() {
                    widget.currentDate = widget.currentDate.nextDay();                    
                  })
                },
                iconSize: 30.0,
                color: Colors.grey,
              )
            ],
          ),
        ],
      ),
    );
  }
}
