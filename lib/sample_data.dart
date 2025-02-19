import 'package:flutter/material.dart';
import 'package:outfit4ride/outfit.dart';
import 'package:outfit4ride/outfit_category.dart';

class SampleData {

  static Outfit outfit1 = Outfit(
    id: '1',
    name: 'Giacca rossa',
    image: 'assets/closet/jacket.png',
    brand: "DHB",
    category: 4,
    minTemp: 2,
    maxTemp: 25,
    isWaterproof: true,
    isWindshield: true,
  );

  static Outfit outfit2 = Outfit(
    id: '2',
    name: 'Guanti rossi',
    image: 'assets/closet/gloves.jpg',
    brand: "Fox",
    category: 1,
    minTemp: 8,
    maxTemp: 15,
    isWaterproof: true,
    isWindshield: false,
  );

  static Outfit outfit3 = Outfit(
    id: '3',
    name: 'Sleuth DLX',
    image: 'assets/closet/shoes.png',
    brand: "Five Ten",
    category: 2,
    minTemp: 8,
    maxTemp: 20,
    isWaterproof: false,
    isWindshield: false,
  );

  static Outfit outfit4 = Outfit(
    id: '4',
    name: 'Maglia nera',
    image: 'assets/closet/jersey_long.png',
    brand: "Nukeproof",
    category: 5,
    minTemp: 2,
    maxTemp: 15,
    isWaterproof: false,
    isWindshield: true,
  );

  static Outfit outfit5 = Outfit(
    id: '5',
    name: 'Maglietta gialla',
    image: 'assets/closet/jersey_short.png',
    brand: "Endura",
    category: 5,
    minTemp: 15,
    maxTemp: 30,
    isWaterproof: false,
    isWindshield: false,
  );

  static Outfit outfit6 = Outfit(
    id: '6',
    name: 'Pantaloni corti',
    image: 'assets/closet/short.png',
    brand: "Endura",
    category: 3,
    minTemp: 15,
    maxTemp: 30,
    isWaterproof: false,
    isWindshield: false,
  );

  static Outfit outfit7 = Outfit(
    id: '7',
    name: 'Pantaloni lunghi',
    image: 'assets/closet/tight.png',
    brand: "Endura",
    category: 3,
    minTemp: 2,
    maxTemp: 15,
    isWaterproof: true,
    isWindshield: true,
  );

  static List<Outfit> allOutfits = [
    outfit1,
    outfit2,
    outfit3,
    outfit4,
    outfit5,
    outfit6,
    outfit7,
  ];

  static OutfitCategory category0 = OutfitCategory(
    id: 0,
    name: 'Other',
    color: Colors.white,
  );

  static OutfitCategory category1 = OutfitCategory(
    id: 1,
    name: 'Gloves',
    color: Colors.yellowAccent,
  );

  static OutfitCategory category2 = OutfitCategory(
      id: 2,
      name: 'Shoes',
      color: Colors.blueAccent,
  );

  static OutfitCategory category3 = OutfitCategory(
      id: 3,
      name: 'Pants',
      color: Colors.cyan,
  );

  static OutfitCategory category4 = OutfitCategory(
      id: 4,
      name: 'Jackets',
      color: Colors.green,
  );

  static OutfitCategory category5 = OutfitCategory(
      id: 5,
      name: 'Jerseys',
      color: Colors.deepPurpleAccent,
  );

  static List<OutfitCategory> allOutfitOutfitCategories = [
    category0,
    category1,
    category2,
    category3,
    category4,
    category5,
  ];

  static List<String> allWeather = [
    'cloudy',
    'pouring',
    'rainy',
    'sunny',
    'windy',
  ];
}