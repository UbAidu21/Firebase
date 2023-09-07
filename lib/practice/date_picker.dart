import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DatePicking extends StatefulWidget {
  const DatePicking({super.key});

  @override
  State<DatePicking> createState() => _DatePickingState();
}

class _DatePickingState extends State<DatePicking> {
  // Create a text controller to store date value
  final TextEditingController _controller = TextEditingController();

  // Create a date format object to specify the format of date string
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Date Picker Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Create a text field that shows date picker on tap
              TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: 'Select your date of birth'),
                onTap: () {
                  // Call the method to show date picker dialog
                  _selectDate(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Define a method to show date picker dialog and set text controller value
  Future<void> _selectDate(BuildContext context) async {
    // Get the current date
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      // Format the picked date using date format object
      String formattedDate = _dateFormat.addPattern('yyyy-mm-dd').format(picked);
      // Set the text controller value with formatted date string
      _controller.text = formattedDate;
    }
  }
}