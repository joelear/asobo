import '/flutter_flow/flutter_flow_util.dart';
import '/play/calendar_week/calendar_week_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calendar_model.dart';
export 'calendar_model.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    super.key,
    required this.callbackAction,
  });

  final Future Function(DateTime day)? callbackAction;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late CalendarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      curve: Curves.easeIn,
      height: valueOrDefault<double>(
        () {
          if (FFAppState()
                  .calendarBlank
                  .months
                  .elementAtOrNull(_model.pageViewCurrentIndex)
                  ?.weeks
                  .length ==
              5) {
            return 265.0;
          } else if (FFAppState()
                  .calendarBlank
                  .months
                  .elementAtOrNull(_model.pageViewCurrentIndex)
                  ?.weeks
                  .length ==
              6) {
            return 318.0;
          } else {
            return 265.0;
          }
        }(),
        265.0,
      ),
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          final months = FFAppState().calendarBlank.months.toList();

          return Container(
            width: double.infinity,
            child: PageView.builder(
              controller: _model.pageViewController ??= PageController(
                  initialPage: max(
                      0,
                      min(
                          valueOrDefault<int>(
                            months
                                    .where((e) =>
                                        e.firstTimeStamp! < getCurrentTimestamp)
                                    .toList()
                                    .length -
                                1,
                            0,
                          ),
                          months.length - 1))),
              onPageChanged: (_) async {
                safeSetState(() {});
              },
              scrollDirection: Axis.vertical,
              itemCount: months.length,
              itemBuilder: (context, monthsIndex) {
                final monthsItem = months[monthsIndex];
                return Container(
                  height: 500.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CalendarWeekWidget(
                        key: Key('Keyk5m_${monthsIndex}_of_${months.length}'),
                        week: monthsItem.weeks.elementAtOrNull(0)!,
                        callbackAction: (day) async {
                          await widget.callbackAction?.call(
                            day,
                          );
                        },
                      ),
                      CalendarWeekWidget(
                        key: Key('Keyupg_${monthsIndex}_of_${months.length}'),
                        week: monthsItem.weeks.elementAtOrNull(1)!,
                        callbackAction: (day) async {
                          await widget.callbackAction?.call(
                            day,
                          );
                        },
                      ),
                      CalendarWeekWidget(
                        key: Key('Keyua9_${monthsIndex}_of_${months.length}'),
                        week: monthsItem.weeks.elementAtOrNull(2)!,
                        callbackAction: (day) async {
                          await widget.callbackAction?.call(
                            day,
                          );
                        },
                      ),
                      CalendarWeekWidget(
                        key: Key('Key83s_${monthsIndex}_of_${months.length}'),
                        week: monthsItem.weeks.elementAtOrNull(3)!,
                        callbackAction: (day) async {
                          await widget.callbackAction?.call(
                            day,
                          );
                        },
                      ),
                      if (monthsItem.weeks.elementAtOrNull(4) != null)
                        CalendarWeekWidget(
                          key: Key('Keykgm_${monthsIndex}_of_${months.length}'),
                          week: monthsItem.weeks.elementAtOrNull(4)!,
                          callbackAction: (day) async {
                            await widget.callbackAction?.call(
                              day,
                            );
                          },
                        ),
                      if (monthsItem.weeks.elementAtOrNull(5) != null)
                        CalendarWeekWidget(
                          key: Key('Key0de_${monthsIndex}_of_${months.length}'),
                          week: monthsItem.weeks.elementAtOrNull(5)!,
                          callbackAction: (day) async {
                            await widget.callbackAction?.call(
                              day,
                            );
                          },
                        ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
