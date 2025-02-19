import 'package:flutter/material.dart';
import 'package:outfit4ride/outfit.dart';
import 'package:outfit4ride/data_manager.dart';

class OutfitCardSmall extends StatelessWidget {
  final Outfit outfit;

  const OutfitCardSmall({
    super.key,
    required this.outfit
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
      elevation: 10.0,
      shadowColor: DataManager.findCategory(outfit.category).color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: 100,
            height: 100,
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
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}
