import 'package:flutter/material.dart';
import 'package:outfit4ride/outfit.dart';
import 'package:outfit4ride/sample_data.dart';

class ClosetManager extends ChangeNotifier {
  final List<Outfit> _allOutfits = SampleData.allOutfits;

  List<Outfit> get allOutfits => List.unmodifiable(_allOutfits);

  void deleteItem(int index){
    _allOutfits.removeAt(index);
    notifyListeners();
  }

  void addItem(Outfit item){
    _allOutfits.add(item);
    notifyListeners();
  }

  void updateItem(Outfit item, int index){
    _allOutfits[index] = item;
    notifyListeners();
  }

  String lastId() {
    int lastId = allOutfits.length + 1;
    return lastId.toString();
  }
}