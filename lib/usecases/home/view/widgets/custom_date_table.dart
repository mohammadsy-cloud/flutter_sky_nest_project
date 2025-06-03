import 'package:sky_nest/usecases/home/view/pages/hotel_info_page.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomDateTable extends StatefulWidget {
  const CustomDateTable({super.key, required this.onSelectDate});
  final void Function(DateTime selectedDate) onSelectDate;

  @override
  State<CustomDateTable> createState() => _CustomDateTableState();
}

class _CustomDateTableState extends State<CustomDateTable> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
          widget.onSelectDate(selectedDay);
        });
      },
      rowHeight: 50,
      firstDay: DateTime.now(),
      focusedDay: _focusedDay,
      lastDay: DateTime(2027),
    );
  }

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
}
