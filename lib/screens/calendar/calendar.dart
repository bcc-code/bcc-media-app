import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/calendar.graphql.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
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
  Future<Query$CalendarDay$calendar?>? _selectedDayEvent;

  HashSet<DateTime> activeDaysPeriod = HashSet<DateTime>();
  List<String> eventsPeriod = [];

  final kFirstDay = DateTime(DateTime.now().year - (5 * pow(10, 4)) as int,
      DateTime.now().month, DateTime.now().day);
  final kLastDay = DateTime(DateTime.now().year + 5 * pow(10, 4) as int,
      DateTime.now().month, DateTime.now().day);

  List<DateTime> _getEventsForDay(DateTime day) {
    List<DateTime> result = [];
    for (var i in activeDaysPeriod) {
      if (i.year == day.year && i.month == day.month && i.day == day.day) {
        result.add(i);
      }
    }
    return result;
  }

  bool _isSameWeekAsCurrentWeek(DateTime date) {
    return _getWeekNumber(date).toString() ==
        _getWeekNumber(DateTime.now()).toString();
  }

  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  int numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat('D').format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  /// https://stackoverflow.com/questions/49393231/how-to-get-day-of-year-week-of-year-from-a-datetime-dart-object/54129275#54129275
  int _getWeekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat('D').format(date));
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
    return DateFormat('yyyy-MM-dd').format(time);
  }

  List<String> expandStartNEndDate(String first, String last) {
    /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
    DateTime startDate = DateTime.parse(first);
    DateTime endDate = DateTime.parse(last);
    final dayCount = endDate.difference(startDate).inDays + 1;

    return List.generate(
        dayCount,
        (index) =>
            convertToIso8601inDays(startDate.add(Duration(days: (index)))));
  }

  Widget hightlightMarker(DateTime day, bool isFromDefaultBuilder) {
    var dayString = convertToIso8601inDays(day);
    var thatDayinHLIndex = eventsPeriod.indexOf(dayString);
    var previousDayinHLIndex = eventsPeriod.indexOf(dayString) - 1;
    if (eventsPeriod.contains(convertToIso8601inDays(day))) {
      //within List
      if (thatDayinHLIndex == 0 ||
          previousDayinHLIndex.isNegative ||
          !eventsPeriod.contains(
              convertToIso8601inDays(day.subtract(const Duration(days: 1))))) {
        //is first
        if (!eventsPeriod.contains(
            convertToIso8601inDays(day.subtract(const Duration(days: 1))))) {
          //doesn't have any previous index in the list
          if (!eventsPeriod.contains(
              convertToIso8601inDays(day.add(const Duration(days: 1))))) {
            //doesn't have any following index in the list
            return isFromDefaultBuilder
                ? Stack(
                    children: [
                      const HighLightSingle(),
                      CenterText(Colors.white, day),
                    ],
                  )
                : const HighLightSingle();
          } else {
            return isFromDefaultBuilder
                ? Stack(
                    children: [
                      const HighLightOpen(),
                      CenterText(Colors.white, day),
                    ],
                  )
                : const HighLightOpen();
          }
        }
      } else if (!eventsPeriod
          .contains(convertToIso8601inDays(day.add(const Duration(days: 1))))) {
        return isFromDefaultBuilder
            ? Stack(
                children: [
                  const HighLightClose(),
                  CenterText(Colors.white, day),
                ],
              )
            : const HighLightClose();
      } else {
        return isFromDefaultBuilder
            ? Stack(
                children: [
                  const HighLightMiddle(),
                  CenterText(Colors.white, day),
                ],
              )
            : const HighLightMiddle();
      }
    } else {
      return isFromDefaultBuilder
          ? Stack(
              children: [
                CenterText(Colors.white, day),
              ],
            )
          : const SizedBox.shrink();
    }
    return const SizedBox.shrink();
  }

  loadingInputPeriodData() async {
    var from = convertToIso8601(_focusedDay.subtract(const Duration(days: 31)));
    var to = convertToIso8601(_focusedDay.add(const Duration(days: 31)));
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
      List<DateTime>? activeDaysList111 = value
          .parsedData?.calendar?.period.activeDays
          .map((e) => DateTime.parse(e))
          .toList();

      setState(() {
        activeDaysPeriod = HashSet.from(activeDaysList111 ?? []);
        eventsPeriod = [];
        value.parsedData?.calendar?.period.events.forEach((element) {
          eventsPeriod.addAll(expandStartNEndDate(element.start, element.end));
        });
      });
      eventsPeriod.sort();
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
                        dowTextFormatter: (date, locale) => DateFormat.E(locale)
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
                        titleTextStyle: const TextStyle(
                            fontFamily: 'assets\fontsBarlowBarlow-Bold.ttf',
                            color: Color.fromRGBO(112, 124, 142, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                        leftChevronIcon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Color.fromRGBO(112, 124, 142, 1),
                            size: 16),
                        leftChevronMargin: const EdgeInsets.only(left: 0),
                        rightChevronIcon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Color.fromRGBO(112, 124, 142, 1),
                            size: 16),
                        rightChevronMargin: const EdgeInsets.only(right: 0),
                      ),
                      availableGestures: AvailableGestures.horizontalSwipe,
                      rangeSelectionMode: RangeSelectionMode.disabled,
                      calendarStyle: CalendarStyle(
                        tableBorder: TableBorder.symmetric(),
                        canMarkersOverflow: true,
                        defaultTextStyle: const TextStyle(
                            fontFamily: 'assets\fontsBarlowBarlow-Bold.ttf',
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                        todayTextStyle: const TextStyle(
                            fontFamily: 'assets\fontsBarlowBarlow-Bold.ttf',
                            color: Color.fromRGBO(230, 60, 98, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                        todayDecoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        weekendTextStyle: const TextStyle(
                            fontFamily: 'assets\fontsBarlowBarlow-Bold.ttf',
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                        outsideTextStyle: const TextStyle(
                            fontFamily: 'assets\fontsBarlowBarlow-Bold.ttf',
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                        markerMargin: const EdgeInsets.only(top: 3),
                        markerDecoration: const BoxDecoration(
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
                        setState(() {
                          _focusedDay = focusedDay;
                        });
                        await loadingInputPeriodData();
                      },
                      eventLoader: _getEventsForDay,
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          return Stack(
                            children: [
                              hightlightMarker(day, true),
                            ],
                          );
                        },
                        outsideBuilder: (context, day, focusedDay) {
                          return Stack(
                            children: <Widget>[
                              Center(
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CenterText(Colors.grey, day),
                                ),
                              ),
                              hightlightMarker(day, false),
                            ],
                          );
                        },
                        selectedBuilder: (context, day, focusedDay) {
                          if (normalizeDate(focusedDay) !=
                              normalizeDate(DateTime.now())) {
                            return Stack(
                              children: [
                                Center(
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            112, 124, 142, 0.3),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.elliptical(30, 30))),
                                    child: CenterText(Colors.white, day),
                                  ),
                                ),
                                hightlightMarker(day, false),
                              ],
                            );
                          } else {
                            return Center(
                              child: Container(
                                width: 33,
                                height: 33,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                        112, 124, 142, 0.3),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.elliptical(30, 30))),
                                child: Center(
                                  child: Text(
                                    '${day.day}',
                                    style: const TextStyle(
                                        fontFamily:
                                            'assets\fontsBarlowBarlow-Bold.ttf',
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
                  const Divider(
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
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'assets\fontsBarlowBarlow-Bold.ttf',
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
                            ConnectionState.waiting) {
                          return const Center(
                            child: SizedBox.square(
                              dimension: 50,
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
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
    );
  }
}

class CenterText extends StatelessWidget {
  final DateTime day;
  final Color color;
  const CenterText(this.color, this.day, {super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${day.day}',
        style: TextStyle(
            fontFamily: 'assets\fontsBarlowBarlow-Bold.ttf',
            color: color,
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
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 6),
      decoration: const BoxDecoration(
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
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 6),
      decoration: const BoxDecoration(
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
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: const BoxDecoration(
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
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(110, 176, 230, 0.15),
          borderRadius: BorderRadius.circular(40)),
    );
  }
}

class _EntriesSlot extends StatelessWidget {
  final AsyncSnapshot<Query$CalendarDay$calendar?> _snapshot;

  const _EntriesSlot(this._snapshot);

  String calculateDuration(String st, String et) {
    Duration duration = DateTime.parse(et).difference(DateTime.parse(st));
    String hour = (duration.inHours % 24 == 0 && duration.inHours != 24)
        ? ''
        : '${(duration.inHours).toString()}h';
    String minutes = duration.inMinutes % 60 == 0
        ? ''
        : '${(duration.inMinutes % 60).toString()}m';

    return '$hour $minutes';
  }

  bool isClassOfEpisodeCalendarEntry(var input) {
    return (input is Fragment$CalendarDay$entries$$EpisodeCalendarEntry);
  }

  bool isHappeningNow(String endStr, String stStr) {
    return DateTime.parse(endStr).isAfter(DateTime.now()) &&
        DateTime.parse(stStr).isBefore(DateTime.now());
  }

  pushToEpisodePage(BuildContext context, var id) {
    context.router.push(EpisodeScreenRoute(episodeId: id));
  }

  @override
  Widget build(BuildContext context) {
    var eventsList = _snapshot.data?.day.events;
    var entriesList = _snapshot.data?.day.entries;
    return Column(
      children: <Widget>[
        if (entriesList != null && entriesList.isNotEmpty) ...[
          (eventsList != null)
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                )
              : const Text('ingen bilder'),
          for (var i = 0; i < entriesList!.length; i++)
            GestureDetector(
              onTapUp: (details) {
                isClassOfEpisodeCalendarEntry(entriesList[i])
                    ? pushToEpisodePage(context, entriesList[i].id)
                    : null;
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: BoxDecoration(
                  color:
                      isHappeningNow(entriesList[i].end, entriesList[i].start)
                          ? Colors.red
                          : null,
                  border: Border(
                    left:
                        isHappeningNow(entriesList[i].end, entriesList[i].start)
                            ? const BorderSide(
                                color: Color.fromRGBO(230, 60, 98, 1), width: 4)
                            : const BorderSide(width: 4),
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
                            isHappeningNow(
                                    entriesList[i].end, entriesList[i].start)
                                ? 'Now'
                                : DateTime.parse(entriesList[i].start)
                                    .toIso8601String()
                                    .substring(11, 16),
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                fontFamily: 'assets\fontsBarlowBarlow-Bold.ttf',
                                color: isClassOfEpisodeCalendarEntry(
                                        entriesList[i])
                                    ? Colors.white
                                    : Colors.white54),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            calculateDuration(
                                entriesList[i].start, entriesList[i].end),
                            style: TextStyle(
                              color: isClassOfEpisodeCalendarEntry(
                                      entriesList[i])
                                  ? const Color.fromRGBO(112, 124, 142, 1)
                                  : const Color.fromRGBO(112, 124, 142, 0.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily:
                                  'assets\fontsBarlowBarlow-Regular.ttf',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entriesList[i].title,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              fontFamily:
                                  'assets\fontsBarlowBarlow-Regular.ttf',
                              color:
                                  isClassOfEpisodeCalendarEntry(entriesList[i])
                                      ? Colors.white
                                      : Colors.white54),
                        ),
                        const SizedBox(height: 4),
                        Text(entriesList[i].description,
                            style: TextStyle(
                              color: isHappeningNow(
                                      entriesList[i].end, entriesList[i].start)
                                  ? isClassOfEpisodeCalendarEntry(
                                          entriesList[i])
                                      ? Colors.red
                                      : Colors.pink[800]
                                  : const Color.fromRGBO(110, 176, 230, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily:
                                  'assets\fontsBarlowBarlow-Regular.ttf',
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          const TvGuideTime()
        ] else ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Ingen planlagte sendinger',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    fontFamily: 'assets\fontsBarlowBarlow-Regular.ttf',
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

class TvGuideTime extends StatelessWidget {
  const TvGuideTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 23.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tv guide timetable is in your local time: ${DateTime.now().timeZoneName}',
            style: const TextStyle(
              color: Color.fromRGBO(112, 124, 142, 1),
              fontSize: 14,
              fontFamily: 'assets\fontsBarlowBarlow-Regular.ttf',
            ),
          ),
        ],
      ),
    );
  }
}
