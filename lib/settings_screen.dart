import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:outfit4ride/settings_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          title: Text("Settings"),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  buildTemperatureAppearanceRow(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTemperatureAppearanceRow() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<SettingsManager>(
            builder: (context, settingsManager, child) {
          return Column(children: [
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              leading: Image.asset(
                'assets/thermometer.png',
              ),
              title: Text('Temperature appearance'),
              subtitle: Text(settingsManager.tOffset.round().toString()),
            ),
            Slider(
              value: settingsManager.tOffset,
              min: -10,
              max: 10,
              divisions: 20,
              activeColor: Colors.red,
              inactiveColor: Colors.blue,
              thumbColor: settingsManager.tOffset == 0 ? Colors.orange : settingsManager.tOffset > 0 ? Colors.red : Colors.blue,
              label: settingsManager.tOffset.round().toString(),
              onChanged: (double value) {
                setState(() {
                  settingsManager.tOffset = value;
                });
              },
            )
          ]);
        })
    );
  }
}
