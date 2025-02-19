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
    return Consumer<SettingsManager>(
      builder: (context, manager, child) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                        child: Column(children: [
                          ListTile(
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                            leading: Image.asset('assets/thermometer.png',),
                            title: Text('Temperature appearance',
                            style: Theme.of(context).textTheme.titleLarge,),
                            subtitle: Text(manager.tOffset.round().toString(),
                              style: Theme.of(context).textTheme.titleMedium,),
                          ),
                          Slider(
                            value: manager.tOffset,
                            min: -10,
                            max: 10,
                            divisions: 20,
                            activeColor: Colors.red,
                            inactiveColor: Colors.blue,
                            thumbColor: manager.tOffset == 0 ? Color(0xFFF1600D) : manager.tOffset > 0 ? Colors.red : Colors.blue,
                            label: manager.tOffset.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                manager.tOffset = value;
                              });
                            },
                          )]
                        ),
                      )
                  ],
                ),
              )],
            ),
          );
        }
      );
    }
}
