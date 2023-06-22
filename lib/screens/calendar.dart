import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/calendar.graphql.dart';
import 'package:brunstadtv_app/helpers/ui/svg_icons.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../helpers/date_time.dart';
import '../helpers/episode_state.dart';
import '../helpers/insets.dart';
import '../theme/design_system/design_system.dart';

import '../helpers/constants.dart';
import '../l10n/app_localizations.dart';
import '../models/analytics/calendar_day_clicked.dart';
import '../providers/analytics.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  ConsumerState<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> {
  bool collapsed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenInsetAppBar(
        appBar: AppBar(
          title: Text(S.of(context).calendar),
          actions: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapUp: (details) {
                setState(() {
                  collapsed = !collapsed;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: collapsed ? SvgPicture.string(SvgIcons.calendar1Line) : SvgPicture.string(SvgIcons.calendar2Lines),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: screenInsets(context),
          child: CalendarWidget(collapsed: collapsed),
        ),
      ),
    );
  }
}

class CalendarWidget extends ConsumerStatefulWidget {
  const CalendarWidget({super.key, required this.collapsed});

  final bool collapsed;

  @override
  ConsumerState<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends ConsumerState<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  Future<Query$CalendarPeriod$calendar$period?>? _calendarPeriodFuture;
  Future<Query$CalendarDay$calendar?>? _selectedDayFuture;
  HashSet<DateTime> activeDaysPeriod = HashSet<DateTime>();
  List<String> eventsPeriod = [];

  final kFirstDay = DateTime(DateTime.now().year - (5 * pow(10, 4)) as int, DateTime.now().month, DateTime.now().day);
  final kLastDay = DateTime(DateTime.now().year + 5 * pow(10, 4) as int, DateTime.now().month, DateTime.now().day);

  @override
  initState() {
    super.initState();
    loadInputPeriodData();
    loadSelectedDay();
  }

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
    return _getWeekNumber(date).toString() == _getWeekNumber(DateTime.now()).toString();
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

  String convertToIso8601inDays(DateTime time) {
    return DateFormat('yyyy-MM-dd').format(time);
  }

  List<String> expandStartNEndDate(String first, String last) {
    /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
    DateTime startDate = DateTime.parse(first);
    DateTime endDate = DateTime.parse(last);
    final dayCount = endDate.difference(startDate).inDays + 1;
    if (dayCount <= 0) return [];
    return List.generate(dayCount, (index) => convertToIso8601inDays(startDate.add(Duration(days: (index)))));
  }

  Widget getEventHighlightFor(DateTime day) {
    final isNotPartOfEvent = !eventsPeriod.contains(convertToIso8601inDays(day));
    final isFirstDay = !eventsPeriod.contains(convertToIso8601inDays(day.subtract(const Duration(days: 1))));
    final isLastDay = !eventsPeriod.contains(convertToIso8601inDays(day.add(const Duration(days: 1))));
    if (isNotPartOfEvent) {
      return const SizedBox.shrink();
    }
    if (isFirstDay && isLastDay) {
      return const HighLightSingle();
    }
    if (isFirstDay) {
      return const HighLightOpen();
    }
    if (isLastDay) {
      return const HighLightClose();
    }
    return const HighLightMiddle();
  }

  loadInputPeriodData() async {
    var from = getFormattedDateTime(_focusedDay.subtract(const Duration(days: 40)));
    var to = getFormattedDateTime(_focusedDay.add(const Duration(days: 40)));
    final client = ref.read(gqlClientProvider);

    _calendarPeriodFuture = client
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
      List<DateTime>? activeDaysList111 = value.parsedData?.calendar?.period.activeDays.map((e) => DateTime.parse(e).toLocal()).toList();

      setState(() {
        activeDaysPeriod = HashSet.from(activeDaysList111 ?? []);
        eventsPeriod = [];
        // TODO: refactor to use map() etc.
        value.parsedData?.calendar?.period.events.forEach((element) {
          eventsPeriod.addAll(expandStartNEndDate(element.start, element.end));
        });
        eventsPeriod.sort();
      });
      return value.parsedData?.calendar?.period;
    });
    return await _calendarPeriodFuture;
  }

  loadSelectedDay() {
    final client = ref.read(gqlClientProvider);
    _selectedDayFuture = client
        .query$CalendarDay(Options$Query$CalendarDay(variables: Variables$Query$CalendarDay(date: getFormattedDateTime(_selectedDay!))))
        .onError((error, stackTrace) {
      1;
      print('ERROR: $error');
      throw Error();
    }).then((value) {
      if (value.hasException) {
        throw ErrorDescription(value.exception.toString());
      }
      return value.parsedData?.calendar;
    });
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TableCalendar(
            rowHeight: 54,
            shouldFillViewport: false,
            calendarFormat: widget.collapsed ? CalendarFormat.week : CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (date, locale) => DateFormat.E(locale).format(date)[0], //only display one letter
              weekdayStyle: design.textStyles.caption1,
              weekendStyle: design.textStyles.caption1,
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextFormatter: (date, locale) => widget.collapsed
                  ? _isSameWeekAsCurrentWeek(date)
                      ? S.of(context).calendarThisWeek
                      : '${S.of(context).calendarWeek} ${_getWeekNumber(date).toString()}'
                  : DateFormat.MMMM().format(date).toString(),
              headerMargin: EdgeInsets.zero,
              titleTextStyle: design.textStyles.caption1,
              leftChevronIcon: Icon(Icons.arrow_back_ios_new_outlined, color: design.colors.label4, size: 16),
              leftChevronMargin: const EdgeInsets.only(left: 0),
              rightChevronIcon: Icon(Icons.arrow_forward_ios_outlined, color: design.colors.label4, size: 16),
              rightChevronMargin: const EdgeInsets.only(right: 0),
            ),
            availableGestures: AvailableGestures.horizontalSwipe,
            rangeSelectionMode: RangeSelectionMode.disabled,
            calendarStyle: CalendarStyle(
              tableBorder: TableBorder.symmetric(),
              canMarkersOverflow: true,
              defaultTextStyle: design.textStyles.title3,
              todayTextStyle: design.textStyles.title3.copyWith(color: design.colors.tint2),
              todayDecoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              weekendTextStyle: design.textStyles.title3,
              outsideTextStyle: const TextStyle(fontFamily: 'Barlow', color: Colors.grey, fontSize: 17, fontWeight: FontWeight.w700),
              markerMargin: const EdgeInsets.only(top: 3),
              markerDecoration: BoxDecoration(
                color: design.colors.label4,
                shape: BoxShape.circle,
              ),
              markerSize: 5.5,
            ),
            focusedDay: _focusedDay,
            firstDay: kFirstDay,
            lastDay: kLastDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onCalendarCreated: (pageController) => loadSelectedDay,
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
                loadSelectedDay();
                final currentRoute = context.router.topRoute;
                if (currentRoute.meta.containsKey(RouteMetaConstants.analyticsName)) {
                  ref.read(analyticsProvider).calendarDayClicked(
                        CalendarDayClickedEvent(
                          pageCode: currentRoute.meta[RouteMetaConstants.analyticsName],
                          calendarView: widget.collapsed ? 'week' : 'month',
                          calendarDate: DateFormat('yyyy-MM-dd').format(selectedDay),
                        ),
                      );
                }
              }
            },
            onPageChanged: (focusedDay) async {
              setState(() {
                _focusedDay = focusedDay;
              });
              await loadInputPeriodData();
            },
            eventLoader: _getEventsForDay,
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                return Stack(
                  children: [
                    getEventHighlightFor(day),
                    CenterText(design.colors.label1, day),
                  ],
                );
              },
              todayBuilder: (context, day, focusedDay) => Stack(
                children: [
                  getEventHighlightFor(day),
                  CenterText(design.colors.tint2, day),
                ],
              ),
              outsideBuilder: (context, day, focusedDay) {
                return Stack(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CenterText(design.colors.label1.withOpacity(0.5), day),
                      ),
                    ),
                    getEventHighlightFor(day),
                  ],
                );
              },
              selectedBuilder: (context, day, focusedDay) {
                if (normalizeDate(day) != normalizeDate(DateTime.now())) {
                  return Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: design.colors.label4.withOpacity(0.3),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.all(Radius.elliptical(30, 30))),
                          child: CenterText(Colors.white, day),
                        ),
                      ),
                      getEventHighlightFor(day),
                    ],
                  );
                } else {
                  return Stack(
                    children: [
                      getEventHighlightFor(day),
                      Center(
                        child: Container(
                          width: 33,
                          height: 33,
                          decoration: BoxDecoration(
                              color: design.colors.label4.withOpacity(0.3),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.all(Radius.elliptical(30, 30))),
                          child: Center(
                            child: Text(
                              '${day.day}',
                              style: design.textStyles.title3.copyWith(color: design.colors.tint2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
        Divider(
          color: design.colors.separatorOnLight,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (_selectedDay != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Builder(builder: (context) {
                  final isToday = isSameDay(_selectedDay, DateTime.now());
                  return Text(
                    '${isToday ? S.of(context).today : DateFormat(DateFormat.WEEKDAY).format(_selectedDay!).capitalized}, ${DateFormat(DateFormat.MONTH_DAY).format(_selectedDay!)}',
                    style: design.textStyles.title2,
                  );
                }),
              ),
          ],
        ),
        FutureBuilder<Query$CalendarDay$calendar?>(
          future: _selectedDayFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBox.square(
                  dimension: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return _EntriesSlot(snapshot.data);
          },
        ),
      ],
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
        style: DesignSystem.of(context).textStyles.title3.copyWith(color: color),
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
      decoration: BoxDecoration(
          color: DesignSystem.of(context).colors.tint1.withOpacity(0.15),
          borderRadius: const BorderRadius.only(
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
      decoration: BoxDecoration(
          color: DesignSystem.of(context).colors.tint1.withOpacity(0.15),
          borderRadius: const BorderRadius.only(
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
      decoration: BoxDecoration(
        color: DesignSystem.of(context).colors.tint1.withOpacity(0.15),
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
      decoration: BoxDecoration(color: DesignSystem.of(context).colors.tint1.withOpacity(0.15), borderRadius: BorderRadius.circular(40)),
    );
  }
}

class _EntriesSlot extends StatelessWidget {
  final Query$CalendarDay$calendar? _calendarDay;

  const _EntriesSlot(this._calendarDay);

  String calculateDuration(String st, String et) {
    Duration duration = DateTime.parse(et).difference(DateTime.parse(st));
    String hour = (duration.inHours == 0) ? '' : '${duration.inHours}h';
    String minutes = duration.inMinutes % 60 == 0 ? '' : '${(duration.inMinutes % 60).toString()}m';

    return '$hour $minutes'.trim();
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    var entriesList = _calendarDay?.day.entries;
    return Column(
      children: <Widget>[
        if (entriesList != null && entriesList.isNotEmpty) ...[
          ...entriesList.map((entry) {
            final episode = entry.asOrNull<Fragment$CalendarDay$entries$$EpisodeCalendarEntry>();
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapUp: (details) {
                if (episode?.episode?.locked == false) {
                  context.router.navigate(
                    HomeScreenWrapperRoute(children: [
                      EpisodeScreenRoute(episodeId: episode!.episode!.id),
                    ]),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: BoxDecoration(
                  color: isLiveNow(entry.start, entry.end) ? design.colors.tint2.withOpacity(0.1) : null,
                ),
                foregroundDecoration: isLiveNow(entry.start, entry.end)
                    ? BoxDecoration(
                        border: Border(
                          left: BorderSide(color: design.colors.tint2, width: 4),
                        ),
                      )
                    : null,
                child: Opacity(
                  opacity: episode?.episode?.locked == false ? 1 : 0.7,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isLiveNow(entry.start, entry.end)
                                  ? S.of(context).now
                                  : DateFormat('HH:mm').format(DateTime.parse(entry.start).toLocal()),
                              style: design.textStyles.title3,
                            ),
                            const SizedBox(height: 4),
                            Text(calculateDuration(entry.start, entry.end), style: design.textStyles.caption1),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.title,
                              style: design.textStyles.title3.copyWith(color: design.colors.label1),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              entry.description,
                              overflow: TextOverflow.ellipsis,
                              style: design.textStyles.caption1
                                  .copyWith(color: isLiveNow(entry.start, entry.end) ? design.colors.tint2 : design.colors.tint1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    S.of(context).timezoneInformation(DateTime.now().timeZoneName),
                    style: DesignSystem.of(context).textStyles.caption1,
                  ),
                ),
              ],
            ),
          )
        ] else ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).noPlannedEvents,
                  style: design.textStyles.title3,
                )
              ],
            ),
          )
        ]
      ],
    );
  }
}
