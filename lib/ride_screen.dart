import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'package:outfit4ride/closet_manager.dart';
import 'package:outfit4ride/forecast_screen.dart';
import 'package:provider/provider.dart';
import 'package:time_range_picker/time_range_picker.dart';

class RideScreen extends StatefulWidget {
  const RideScreen({super.key});

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  FilePickerResult? result;
  AssetImage _image = AssetImage('assets/drive_folder_upload.png');
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.fromDateTime(DateTime.now().add(const Duration(hours: 1)));
  TimeRange _timeRange = TimeRange(startTime: TimeOfDay.now(), endTime: TimeOfDay.now());
  bool _isDisable = true;


  @override
  Widget build(BuildContext context) {

    return Consumer<ClosetManager>(
        builder: (context, manager, child) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTrackField(),
                    const SizedBox(height: 30.0),
                    buildDateField(),
                    const SizedBox(height: 30.0),
                    buildDurationField(),
                    const SizedBox(height: 30.0),
                    buildButtonFields()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
                child: FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  setState(() {
                    _image = AssetImage('assets/drive_folder_upload.png');
                    _selectedDate = DateTime.now();
                    _startTime = TimeOfDay.now();
                    _endTime = TimeOfDay.fromDateTime(DateTime.now().add(const Duration(hours: 1)));
                    _timeRange = TimeRange(startTime: _startTime, endTime: _endTime);
                    _isDisable = true;
                  });
                },
                child: const Icon(Icons.refresh_outlined),
                ),
              )]
            );
          },
        );
  }

  Widget buildTrackField() {
    return IconButton(
      onPressed: () async {
        result = await FilePicker.platform.pickFiles(allowMultiple: false);
        if (result != null) {
          setState(() {
            _isDisable = false;
            _image = AssetImage('assets/maps.png');
          });
        }
      },
      icon: Image(
        image: _image,
        width: 200,
        height: 200,
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate, // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 10)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

    Widget buildDateField() {
      return ElevatedButton.icon(
        label: Text("${_selectedDate.toLocal()}".split(' ')[0],
        //style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.edit_calendar),
        onPressed: ()  {
          _selectDate(context);
        },
      );
    }

    String _timeToString(TimeOfDay timeOfDay) {
      final localizations = MaterialLocalizations.of(context);
      return localizations.formatTimeOfDay(timeOfDay,
          alwaysUse24HourFormat: true);
    }

  Widget buildDurationField() {
    final String startTime = _timeToString(_timeRange.startTime);
    final String endTime = _timeToString(_timeRange.endTime);
    return ElevatedButton.icon(
      label: Text("Duration: from $startTime to $endTime"),
      icon: const Icon(Icons.access_time_outlined),
        onPressed: () async {
        final resultTimeRange = await showTimeRangePicker(context: context,
        start: _startTime,
        end: _endTime);
        setState(()  {
          _startTime = resultTimeRange.startTime;
          _endTime = resultTimeRange.endTime;
          _timeRange = TimeRange(startTime: _startTime,
              endTime: _endTime);
        });
      },
    );
  }

  Widget buildButtonFields() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        //foregroundColor: Colors.green,
        //backgroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        shadowColor: Colors.greenAccent,
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0)),
      ),
        onPressed: () {
          _isDisable? null :  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const ForecastScreen(),
              )
          );
        },
        child: Text("Ride")
    );
  }

}