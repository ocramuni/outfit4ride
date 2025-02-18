import 'package:flutter/material.dart';
import 'package:outfit4ride/outfit_category.dart';
import 'package:outfit4ride/sample_data.dart';

class DataManager extends ChangeNotifier {
  final List<OutfitCategory> _allOutfitCategories = SampleData.allOutfitOutfitCategories;

  List<OutfitCategory> get allOutfitOutfitCategories => List.unmodifiable(_allOutfitCategories); // non permette la modifica dei dati

  static OutfitCategory findCategory(int id) => SampleData.allOutfitOutfitCategories.firstWhere((category) => category.id == id);

  static List<OutfitCategory> getAllOutfitOutfitCategories() {
    return List.unmodifiable(SampleData.allOutfitOutfitCategories);
  }
}