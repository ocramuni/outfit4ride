import 'package:flutter/material.dart';
import 'package:outfit4ride/ride_screen.dart';
import 'package:outfit4ride/settings_manager.dart';
import 'package:outfit4ride/settings_screen.dart';
import 'package:provider/provider.dart';

import 'package:outfit4ride/closet_manager.dart';
import 'package:outfit4ride/closet_screen.dart';
import 'package:outfit4ride/data_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Outfit4RideApp());
}

class Outfit4RideApp extends StatefulWidget {
  const Outfit4RideApp({super.key});

  @override
  State<Outfit4RideApp> createState() => _Outfit4RideAppState();
}

class _Outfit4RideAppState extends State<Outfit4RideApp> {
  // This widget is the root of your application.
  final DataManager _dataManager = DataManager();
  final SettingsManager _settingsManager = SettingsManager();
  final ClosetManager _closetManager = ClosetManager();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _dataManager),
        ChangeNotifierProvider(create: (context) => _settingsManager),
        ChangeNotifierProvider(create: (context) => _closetManager)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Outfit4Ride',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Outfit4RideAppHome(title: 'Outfit4Ride'),
      ),
    );
  }
}

class Outfit4RideAppHome extends StatefulWidget {
  const Outfit4RideAppHome({super.key, required this.title});

  final String title;

  @override
  State<Outfit4RideAppHome> createState() => _Outfit4RideAppHomeState();
}

class _Outfit4RideAppHomeState extends State<Outfit4RideAppHome> {
  int _selectedTabIndex = 0;
  final List<Widget> _pages = <Widget>[
    RideScreen(),
    ClosetScreen(),
    SettingsScreen(),
  ];

  AppBar _appBar(context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedTabIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.pedal_bike), label: "Ride"),
          NavigationDestination(
              icon: Image.asset(
                'assets/wardrobe.png',
                height: 24,
                width: 24,
              ),
              label: "Closet"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      body: IndexedStack(
        index: _selectedTabIndex,
        children: _pages,
      ),
    );
  }
}
