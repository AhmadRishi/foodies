import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodies/modules/meal.dart';
import 'package:foodies/screens/details.dart';

class MealItem extends StatelessWidget {
  const MealItem({required this.items});

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetalis.routeName, arguments: items.id);
  }

  final items;

  String get complexity {
    switch (items.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'null';
    }
  }

  String get affordability {
    switch (items.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;

      case Affordability.Pricey:
        return 'Pricey';
        break;

      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'null';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4.0,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: items.imageUrl,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                    )),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: Container(
                    width: 200,
                    color: Colors.black54,
                    child: Text(
                      items.title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('${items.duration} min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(complexity),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(affordability),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
