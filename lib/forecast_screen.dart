import 'package:flutter/material.dart';
import 'package:outfit4ride/closet_manager.dart';
import 'package:outfit4ride/data_manager.dart';

import 'outfit_card_small.dart';

class ForecastScreen extends StatelessWidget{
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text("Ready to Ride"),
        ),
        body: Column(
          children: [
            Image(
                image: DataManager.getWeatherAsset(),
              width: 150,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Temperature: ${DataManager.getTemperature(context)}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final item = ClosetManager().allOutfits[index];
                  return OutfitCardSmall(
                      outfit: item
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8,);
                },
                itemCount: ClosetManager().allOutfits.length,
              ),
            ),
          ],
        )
    );
    }
}