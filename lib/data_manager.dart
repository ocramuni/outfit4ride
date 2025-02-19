import 'dart:math';

import 'package:flutter/material.dart';
import 'package:outfit4ride/outfit_category.dart';
import 'package:outfit4ride/sample_data.dart';
import 'package:outfit4ride/settings_manager.dart';
import 'package:provider/provider.dart';

class DataManager extends ChangeNotifier {
  final List<OutfitCategory> _allOutfitCategories = SampleData.allOutfitOutfitCategories;

  List<OutfitCategory> get allOutfitOutfitCategories => List.unmodifiable(_allOutfitCategories);

  static OutfitCategory findCategory(int id) => SampleData.allOutfitOutfitCategories.firstWhere((category) => category.id == id);

  static List<OutfitCategory> getAllOutfitOutfitCategories() {
    return List.unmodifiable(SampleData.allOutfitOutfitCategories);
  }

  static AssetImage getWeatherAsset() {
    List<String> weatherList = SampleData.allWeather;
    final random = Random();
    var weather = weatherList[random.nextInt(weatherList.length)];
    return AssetImage('assets/weather-$weather.png');
  }

  static String getTemperature(context) {
    SettingsManager settingsManager = Provider.of<SettingsManager>(context);
    String temperature;
    final double tOffset = settingsManager.tOffset;
    final random = Random();
    int randomNumber = random.nextInt(30);
    if (tOffset != 0) {
      temperature = "${randomNumber.toString()}\u2103 (TA: ${(randomNumber + tOffset).toString()}\u2103)";
    } else {
      temperature = "${randomNumber.toString()}\u2103";
    }
    return temperature;
  }
}