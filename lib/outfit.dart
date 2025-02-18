import 'dart:io';
import 'package:flutter/material.dart';

class Outfit {
  final String id;
  final String name;
  final String image;
  final String brand;
  final int category;
  final int minTemp;
  final int maxTemp;
  final bool isWaterproof;
  final bool isWindshield;
  final File? imagePath;

  Outfit({
    required this.id,
    required this.name,
    required this.image,
    required this.brand,
    required this.category,
    required this.minTemp,
    required this.maxTemp,
    required this.isWaterproof,
    required this.isWindshield,
    this.imagePath,
  });

  ImageProvider getImage() {
    if (imagePath != null) {
      return FileImage(imagePath!);
    } else {
      String asset = (image.isEmpty) ? 'assets/apparel.png' : image;
      return AssetImage(asset);
    }
  }

  bool hasBadge() {
    if (isWaterproof || isWindshield) {
      return true;
    }
    return false;
  }

  String getBadgeText() {
    String badgeText = "";
    if (isWaterproof) {
      badgeText = "WP";
    }
    if (isWindshield) {
      badgeText = "WS";
    }
    if (isWaterproof && isWindshield) {
      badgeText = "WP\nWS";
    }
    return badgeText;
  }
}

