import 'dart:async';
import 'dart:collection';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/calendar.graphql.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter_riverpod/src/consumer.dart'
    show ConsumerState, ConsumerStatefulWidget;
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:riverpod/riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  ConsumerState<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  bool _isCalendarCollapse = true;

  Future<Query$CalendarPeriod$calendar$period?>? _calendarPeriod;
  Future<Query$CalendarDay$calendar?>? _selectedDayEvent = null;

  HashSet<DateTime> activeDaysPeriod = HashSet<DateTime>();
  List<String> eventsPeriod = [];

  final kFirstDay = DateTime(
      DateTime.now().year - 2, DateTime.now().month, DateTime.now().day);
  final kLastDay = DateTime(
      DateTime.now().year + 2, DateTime.now().month, DateTime.now().day);

  List<DateTime> _getEventsForDay(DateTime day) {
    List<DateTime> result = [];
    if (activeDaysPeriod != null) {
      for (var i in activeDaysPeriod) {
        if (i.year == day.year && i.month == day.month && i.day == day.day) {
          result.add(i);
        }
      }
      return result;
    } else
      return List.filled(0, DateTime.now());
  }

  bool _isSameWeekAsCurrentWeek(DateTime date) {
    return _getWeekNumber(date).toString() ==
        _getWeekNumber(DateTime.now()).toString();
  }

  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  int numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  int _getWeekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numOfWeeks(date.year - 1);
    } else if (woy > numOfWeeks(date.year)) {
      woy = 1;
    }
    return woy;
  }

  String convertToIso8601(DateTime time) {
    //need to have a manual convert because the default method have a special 's' -> :sssZ
    return DateFormat("yyyy-MM-ddTHH:mm:ss'Z'").format(time);
  }

  String convertToIso8601inDays(DateTime time) {
    String timeIn8601 = DateFormat("yyyy-MM-ddTHH:mm:ss'Z'").format(time);
    return timeIn8601.substring(0, 10);
  }

  List<String> expandStartNEndDate(String first, String last) {
    /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
    DateTime startDate = DateTime.parse(first);
    DateTime endDate = DateTime.parse(last);
    final dayCount = endDate.difference(startDate).inDays + 1;
    // var length = (endDate.day != startDate.day)
    //     ? endDate.difference(startDate).inDays + 1
    //     : 1;

    return List.generate(
        dayCount,
        (index) =>
            convertToIso8601inDays(startDate.add(Duration(days: (index)))));

    var result = List.generate(dayCount, (index) {
      return convertToIso8601inDays(startDate.add(Duration(days: (index))));
    });
    return result;
  }

  loadingInputPeriodData() async {
    var from = convertToIso8601(_focusedDay!.subtract(Duration(days: 31)));
    var to = convertToIso8601(_focusedDay!.add(Duration(days: 31)));
    final client = ref.read(gqlClientProvider);

    _calendarPeriod = client
        .query$CalendarPeriod(Options$Query$CalendarPeriod(
      variables: Variables$Query$CalendarPeriod(from: from, to: to),
    ))
        .onError((error, stackTrace) {
      1;
      throw Error();
    }).then((value) {
      if (value.hasException) {
        throw ErrorDescription(value.exception.toString());
      }
      List<String> activeDaysList = [];
      value.parsedData?.calendar?.period.activeDays
          .forEach((element) => activeDaysList.add(element));
      activeDaysList.forEach((dayTime) {
        activeDaysPeriod.add(DateTime.parse(dayTime));
      });

      eventsPeriod = [];
      value.parsedData?.calendar?.period.events.forEach((element) {
        eventsPeriod.addAll(expandStartNEndDate(element.start, element.end));
      });
      return value.parsedData?.calendar?.period;
    });
    return await _calendarPeriod;
  }

  loadingSelectedEvent() {
    final client = ref.read(gqlClientProvider);
    _selectedDayEvent = client
        .query$CalendarDay(Options$Query$CalendarDay(
            variables: Variables$Query$CalendarDay(
                date: convertToIso8601(_selectedDay!))))
        .onError((error, stackTrace) {
      1;
      print('ERROR: $error');
      throw Error();
    }).then((value) {
      if (value.hasException) {
        throw ErrorDescription(value.exception.toString());
      }
      value.exception?.linkException?.hashCode ?? 123;
      return value.parsedData?.calendar;
    });
  }

  @override
  void initState() {
    loadingInputPeriodData();
    loadingSelectedEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Calendar ',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          GestureDetector(
                            onTapUp: (details) {
                              setState(() {
                                _isCalendarCollapse = !_isCalendarCollapse;
                              });
                            },
                            child: Image.asset(
                              _isCalendarCollapse
                                  ? 'assets/icons/Calendar_Selected.png'
                                  : 'assets/icons/Calendar_Default.png',
                              gaplessPlayback: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TableCalendar(
                        rowHeight: 54,
                        calendarFormat: _isCalendarCollapse
                            ? CalendarFormat.week
                            : CalendarFormat.month,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                              color: Color.fromRGBO(112, 124, 142, 1)),
                          weekendStyle: TextStyle(
                              color: Color.fromRGBO(112, 124, 142, 1)),
                          dowTextFormatter: (date, locale) =>
                              DateFormat.E(locale)
                                  .format(date)[0], //only display one letter
                        ),
                        shouldFillViewport: true,
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextFormatter: (date, locale) =>
                              _isCalendarCollapse
                                  ? _isSameWeekAsCurrentWeek(date)
                                      ? 'This week'
                                      : 'week ${_getWeekNumber(date).toString()}'
                                  : DateFormat.MMMM().format(date).toString(),
                          headerMargin: EdgeInsets.zero,
                          titleTextStyle: TextStyle(
                              fontFamily: 'assets\fonts\Barlow\Barlow-Bold.ttf',
                              color: Color.fromRGBO(112, 124, 142, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                          leftChevronIcon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Color.fromRGBO(112, 124, 142, 1),
                              size: 16),
                          leftChevronMargin: EdgeInsets.only(left: 0),
                          rightChevronIcon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color.fromRGBO(112, 124, 142, 1),
                              size: 16),
                          rightChevronMargin: EdgeInsets.only(right: 0),
                        ),
                        availableGestures: AvailableGestures.horizontalSwipe,
                        rangeSelectionMode: RangeSelectionMode.disabled,
                        calendarStyle: CalendarStyle(
                          tableBorder: TableBorder.symmetric(),
                          canMarkersOverflow: true,
                          defaultTextStyle: TextStyle(
                              fontFamily: 'assets\fonts\Barlow\Barlow-Bold.ttf',
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                          todayTextStyle: TextStyle(
                              fontFamily: 'assets\fonts\Barlow\Barlow-Bold.ttf',
                              color: Color.fromRGBO(230, 60, 98, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                          todayDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          outsideTextStyle: TextStyle(
                              fontFamily: 'assets\fonts\Barlow\Barlow-Bold.ttf',
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                          markerMargin: EdgeInsets.only(top: 3),
                          markerDecoration: BoxDecoration(
                            color: Color.fromRGBO(112, 124, 142, 1),
                            shape: BoxShape.circle,
                          ),
                          markerSize: 5.5,
                        ),
                        focusedDay: _focusedDay,
                        firstDay: kFirstDay,
                        lastDay: kLastDay,
                        selectedDayPredicate: (day) =>
                            isSameDay(_selectedDay, day),
                        onCalendarCreated: (pageController) =>
                            loadingSelectedEvent,
                        onDaySelected: (selectedDay, focusedDay) {
                          if (!isSameDay(_selectedDay, selectedDay)) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                            });
                            loadingSelectedEvent();
                          }
                        },
                        onPageChanged: (focusedDay) async {
                          _focusedDay = focusedDay;
                          await loadingInputPeriodData();
                          setState(() {
                            eventsPeriod = eventsPeriod;
                          });
                        },
                        eventLoader: _getEventsForDay,
                        calendarBuilders: CalendarBuilders(
                          defaultBuilder: (context, day, focusedDay) {
                            var dayString = convertToIso8601inDays(day);
                            var thatDayinHLIndex =
                                eventsPeriod.indexOf(dayString);
                            var previousDayinHLIndex =
                                eventsPeriod.indexOf(dayString) - 1;
                            if (eventsPeriod.contains(dayString)) {
                              if (thatDayinHLIndex == 0 ||
                                  previousDayinHLIndex.isNegative ||
                                  !eventsPeriod.contains(convertToIso8601inDays(
                                      day.subtract(Duration(days: 1))))) {
                                if (!eventsPeriod.contains(
                                    convertToIso8601inDays(
                                        day.add(Duration(days: 1))))) {
                                  return Stack(
                                    children: [
                                      HighLightSingle(),
                                      CenterText(Colors.white, day),
                                    ],
                                  );
                                } else {
                                  return Stack(
                                    children: [
                                      HighLightOpen(),
                                      CenterText(Colors.white, day),
                                    ],
                                  );
                                }
                              } else if (!eventsPeriod.contains(
                                  convertToIso8601inDays(
                                      day.add(Duration(days: 1))))) {
                                return Stack(
                                  children: [
                                    HighLightClose(),
                                    CenterText(Colors.white, day),
                                  ],
                                );
                              } else {
                                return Stack(
                                  children: [
                                    HighLightMiddle(),
                                    CenterText(Colors.white, day),
                                  ],
                                );
                              }
                            } else
                              return CenterText(Colors.white, day);
                          },
                          outsideBuilder: (context, day, focusedDay) {
                            var dayString = convertToIso8601inDays(day);
                            var thatDayinHLIndex =
                                eventsPeriod.indexOf(dayString);
                            var previousDayinHLIndex =
                                eventsPeriod.indexOf(dayString) - 1;
                            var afterDayinHLIndex =
                                eventsPeriod.indexOf(dayString) + 1;
                            var dayS = day.toString();

                            return Stack(
                              children: <Widget>[
                                Center(
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    child: CenterText(Colors.grey, day),
                                  ),
                                ),
                                eventsPeriod
                                        .contains(convertToIso8601inDays(day))
                                    ? (thatDayinHLIndex == 0 ||
                                            previousDayinHLIndex.isNegative ||
                                            !eventsPeriod.contains(
                                                convertToIso8601inDays(
                                                    day.subtract(
                                                        Duration(days: 1))))
                                        ? (!eventsPeriod.contains(
                                                convertToIso8601inDays(day
                                                    .add(Duration(days: 1)))))
                                            ? HighLightSingle()
                                            : HighLightOpen()
                                        : !eventsPeriod.contains(
                                                convertToIso8601inDays(
                                                    day.add(Duration(days: 1))))
                                            ? HighLightClose()
                                            : HighLightMiddle())
                                    : SizedBox.shrink()
                              ],
                            );
                          },
                          selectedBuilder: (context, day, focusedDay) {
                            var dayString = convertToIso8601inDays(day);
                            var thatDayinHLIndex =
                                eventsPeriod.indexOf(dayString);
                            var previousDayinHLIndex =
                                eventsPeriod.indexOf(dayString) - 1;
                            if (eventsPeriod!.contains(dayString)) {}
                            if (normalizeDate(focusedDay) !=
                                normalizeDate(DateTime.now())) {
                              return Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                              112, 124, 142, 0.3),
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(30, 30))),
                                      child: CenterText(Colors.white, day),
                                    ),
                                  ),
                                  eventsPeriod!
                                          .contains(convertToIso8601inDays(day))
                                      ? (thatDayinHLIndex == 0 ||
                                              previousDayinHLIndex.isNegative ||
                                              !eventsPeriod.contains(
                                                  convertToIso8601inDays(
                                                      day.subtract(
                                                          Duration(days: 1))))
                                          ? (!eventsPeriod.contains(
                                                  convertToIso8601inDays(day
                                                      .add(Duration(days: 1)))))
                                              ? HighLightSingle()
                                              : HighLightOpen()
                                          : !eventsPeriod.contains(
                                                  convertToIso8601inDays(day
                                                      .add(Duration(days: 1))))
                                              ? HighLightClose()
                                              : HighLightMiddle())
                                      : SizedBox.shrink()
                                ],
                              );
                            } else {
                              return Center(
                                child: Container(
                                  width: 33,
                                  height: 33,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(112, 124, 142, 0.3),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(30, 30))),
                                  child: Center(
                                    child: Text(
                                      '${day.day}',
                                      style: TextStyle(
                                          fontFamily:
                                              'assets\fonts\Barlow\Barlow-Bold.ttf',
                                          color: Color.fromRGBO(230, 60, 98, 1),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    Divider(
                      color: Color.fromRGBO(204, 221, 255, 0.1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 24),
                          child: Text(
                            'Today, ${DateFormat('d MMMM').format(DateTime.now())}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'assets\fonts\Barlow\Barlow-Bold.ttf',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: FutureBuilder<Query$CalendarDay$calendar?>(
                        future: _selectedDayEvent,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            return const Center(
                              child: SizedBox.square(
                                dimension: 50,
                                child: CircularProgressIndicator(),
                              ),
                            );
                          return _EntriesSlot(snapshot);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CenterText extends StatelessWidget {
  final DateTime day;
  late Color _color;
  CenterText(this._color, this.day);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${day.day}',
        style: TextStyle(
            fontFamily: 'assets\fonts\Barlow\Barlow-Bold.ttf',
            color: _color,
            fontSize: 17,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}

class HighLightOpen extends StatelessWidget {
  const HighLightOpen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 6),
      decoration: BoxDecoration(
          color: Color.fromRGBO(110, 176, 230, 0.15),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            topLeft: Radius.circular(40),
          )),
    );
  }
}

class HighLightClose extends StatelessWidget {
  const HighLightClose({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 6),
      decoration: BoxDecoration(
          color: Color.fromRGBO(110, 176, 230, 0.15),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
    );
  }
}

class HighLightMiddle extends StatelessWidget {
  const HighLightMiddle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(110, 176, 230, 0.15),
      ),
    );
  }
}

class HighLightSingle extends StatelessWidget {
  const HighLightSingle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      decoration: BoxDecoration(
          color: Color.fromRGBO(110, 176, 230, 0.15),
          borderRadius: BorderRadius.circular(40)),
    );
  }
}

class _EntriesSlot extends StatelessWidget {
  final snapshot;

  _EntriesSlot(this.snapshot);

  String calculateDuration(String st, String et) {
    Duration duration = DateTime.parse(et).difference(DateTime.parse(st));
    String hour = duration.inHours % 24 == 0
        ? ''
        : '${(duration.inHours % 24).toString()}h';
    String minutes = duration.inMinutes % 60 == 0
        ? ''
        : '${(duration.inMinutes % 60).toString()}m';

    return '${hour} ${minutes}';
  }

  bool isClassOfEpisodeCalendarEntry(var input) {
    return (input is Fragment$CalendarDay$entries$$EpisodeCalendarEntry);
  }

  pushToEpisodePage(BuildContext context, var id) {
    context.router.push(EpisodeScreenRoute(episodeId: id));
  }

  @override
  Widget build(BuildContext context) {
    var eventsList = snapshot.data?.day.events;
    var entriesList = snapshot.data?.day.entries;
    return Column(
      children: <Widget>[
        if (entriesList != null && entriesList.isNotEmpty) ...[
          (eventsList != null)
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                )
              : Text('ingen bilder'),
          for (var i = 0; i < entriesList!.length; i++)
            GestureDetector(
              onTapUp: (details) {
                isClassOfEpisodeCalendarEntry(entriesList[i])
                    ? pushToEpisodePage(context, entriesList[i].id)
                    : null;
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: BoxDecoration(
                  color: (DateTime.parse(entriesList[i].end)
                              .isAfter(DateTime.now()) &&
                          DateTime.parse(entriesList[i].end)
                              .isBefore(DateTime.now()))
                      ? Colors.red
                      : null,
                  border: Border(
                    left: (DateTime.parse(entriesList[i].end)
                                .isAfter(DateTime.now()) &&
                            DateTime.parse(entriesList[i].end)
                                .isBefore(DateTime.now()))
                        ? BorderSide(
                            color: Color.fromRGBO(230, 60, 98, 1), width: 4)
                        : BorderSide(width: 4),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (DateTime.parse(entriesList[i].end)
                                        .isAfter(DateTime.now()) &&
                                    DateTime.parse(entriesList[i].end)
                                        .isBefore(DateTime.now()))
                                ? 'Now'
                                : '${DateTime.parse(entriesList[i].start).toIso8601String().substring(11, 16)}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                fontFamily:
                                    'assets\fonts\Barlow\Barlow-Bold.ttf',
                                color: isClassOfEpisodeCalendarEntry(
                                        entriesList[i])
                                    ? Colors.white
                                    : Colors.white54),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${calculateDuration(entriesList[i].start, entriesList[i].end)}',
                            style: TextStyle(
                              color:
                                  isClassOfEpisodeCalendarEntry(entriesList[i])
                                      ? Color.fromRGBO(112, 124, 142, 1)
                                      : Color.fromRGBO(112, 124, 142, 0.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily:
                                  'assets\fonts\Barlow\Barlow-Regular.ttf',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${entriesList[i].title}',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              fontFamily:
                                  'assets\fonts\Barlow\Barlow-Regular.ttf',
                              color:
                                  isClassOfEpisodeCalendarEntry(entriesList[i])
                                      ? Colors.white
                                      : Colors.white54),
                        ),
                        SizedBox(height: 4),
                        Text('${entriesList[i].description}',
                            style: TextStyle(
                              color: (DateTime.parse(entriesList[i].end)
                                          .isAfter(DateTime.now()) &&
                                      DateTime.parse(entriesList[i].end)
                                          .isBefore(DateTime.now()))
                                  ? isClassOfEpisodeCalendarEntry(
                                          entriesList[i])
                                      ? Colors.red
                                      : Colors.pink[800]
                                  : Color.fromRGBO(110, 176, 230, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily:
                                  'assets\fonts\Barlow\Barlow-Regular.ttf',
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          TvGuideTime()
        ] else ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ingen planlagte sendinger',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    fontFamily: 'assets\fonts\Barlow\Barlow-Regular.ttf',
                  ),
                )
              ],
            ),
          )
        ]
      ],
    );
  }
}

class TvGuideTime extends StatefulWidget {
  const TvGuideTime();

  @override
  State<TvGuideTime> createState() => _TvGuideTimeState();
}

class _TvGuideTimeState extends State<TvGuideTime> {
  String time =
      DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString();
  late Timer mytimer;

  @override
  void initState() {
    mytimer = Timer.periodic(Duration(seconds: 1), (timer) {
      time = DateTime.now().hour.toString() +
          ":" +
          DateTime.now().minute.toString();
      setState(() {});
    });
    super.initState();
  }

  @override
  void deactivate() {
    if (mytimer.isActive) {
      mytimer.cancel();
    }
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 23.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tv guide timetable is in your local time: ${DateTime.now().timeZoneName}',
                // 'Tidspunkter er i din lokale tid: ${DateFormat.Hms().format(DateTime.now())} CET',
                style: TextStyle(
                  color: Color.fromRGBO(112, 124, 142, 1),
                  fontSize: 14,
                  fontFamily: 'assets\fonts\Barlow\Barlow-Regular.ttf',
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // 'Tv guide timetable is in your local time: ${DateTime.now().timeZoneName}',
                'Tidspunkter er i din lokale tid: ${time} CET',
                style: TextStyle(
                  color: Color.fromRGBO(112, 124, 142, 1),
                  fontSize: 14,
                  fontFamily: 'assets\fonts\Barlow\Barlow-Regular.ttf',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
