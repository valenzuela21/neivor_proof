import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class CalendarPicker{
  static void dialogBuilder(BuildContext context,TextEditingController dataInputDate) {
    List<DateTime?> _dates = [];
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(8.0),
          contentPadding: const EdgeInsets.all(8.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          content: SizedBox(
            width: 450,
            height: 300,
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.single,
              ),
              value: _dates,
              onValueChanged: (dates) => {_dates.add(dates[0])},
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                dataInputDate.text = '';
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Seleccionar'),
              onPressed: () {
                String formattedDate = DateFormat('yyyy-MM-dd').format(_dates[0]!);
                dataInputDate.text = formattedDate;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}