import 'package:calendar_demo/list_reservations.dart';
import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _currentDate = DateTime(2021,3,22);
  String _calendarTitle;
//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  static Widget _eventIcon = new Container();

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  @override
  void initState() {
    _calendarTitle = DateFormat("yyyy年 M月").format(_currentDate);
    /// Add more events to _markedDateMap EventList
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Example with custom icon
    final _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (date, events) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ListReservationsView(
                      currentDate: date,
                    ),
                ),
        );
      },
      onCalendarChanged: (dateTime) => {
        this.setState(
            () => _calendarTitle = DateFormat("yyyy年 M月").format(dateTime))
      },
      childAspectRatio: 0.8,
      weekdayTextStyle: TextStyle(color: Colors.grey),
      locale: "ja",
      dayPadding: 0.0,
      scrollDirection: Axis.vertical,
      leftButtonIcon: null,
      rightButtonIcon: null,
      thisMonthDayBorderColor: Colors.grey,
      headerText: _calendarTitle,
      headerTextStyle: TextStyle(color: Colors.grey, fontSize: 20),
      width: MediaQuery.of(context).size.width,
      height: 400.0,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      weekDayMargin: EdgeInsets.zero,
      weekDayPadding: EdgeInsets.zero,
      todayBorderColor: Colors.transparent,
      todayButtonColor: Colors.transparent,
      customDayBuilder: (
        bool isSelectable,
        int index,
        bool isSelectedDay,
        bool isToday,
        bool isPrevMonthDay,
        TextStyle textStyle,
        bool isNextMonthDay,
        bool isThisMonthDay,
        DateTime day,
      ) {
        switch (day.weekday) {
          case DateTime.monday:
            {
              return customDayWidget(day, false);
            }
          case DateTime.tuesday:
            {
              return customDayWidget(day, false);
            }
          case DateTime.wednesday:
            {
              return customDayWidget(day, false);
            }
          case DateTime.thursday:
            {
              return customDayWidget(day, false);
            }
          case DateTime.friday:
            {
              return customDayWidget(day, false);
            }
          case DateTime.saturday:
            {
              return customDayWidget(day, true);
            }
          case DateTime.sunday:
            {
              return customDayWidget(day, true);
            }
        }
        return Container();
      },
    );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: _calendarCarousel,
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  Container customDayWidget(DateTime day, bool isWeekend) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(day.day.toString(), style: TextStyle(color: Colors.grey)),
            SizedBox(height: 4),
            isWeekend
                ? Text("週末", style: TextStyle(color: Colors.black))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.red,
                        size: 14.0,
                      ),
                      Text(
                        day.day.toString(),
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  )
          ],
        ),
      ),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
    );
  }
}
