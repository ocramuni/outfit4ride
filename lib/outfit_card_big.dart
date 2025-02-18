import 'package:flutter/material.dart';
import 'package:outfit4ride/outfit.dart';
import 'package:outfit4ride/data_manager.dart';

class OutfitCardBig extends StatelessWidget {
  final Outfit outfit;

  const OutfitCardBig({
    super.key,
    required this.outfit
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20.0,
      shadowColor: DataManager.findCategory(outfit.category).color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Badge(
            isLabelVisible: outfit.hasBadge(),
            offset: Offset(0, 10),
            label: Text(outfit.getBadgeText()),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 150,
              height: 200,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: outfit.getImage(),
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      outfit.name,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 10),
                    Text(
                      outfit.brand,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              outfit.minTemp.toString(),
                              style: Theme.of(context).textTheme.titleMedium),
                          Image(
                              width: 24,
                              height: 24,
                              image:
                                  AssetImage('assets/thermometer-minus.png')),
                          SizedBox(width: 20),
                          Text(
                              outfit.maxTemp.toString(),
                              style: Theme.of(context).textTheme.titleMedium),
                          Image(
                              width: 24,
                              height: 24,
                              image: AssetImage('assets/thermometer-plus.png')),
                        ]
                    ),
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}
