import 'package:flutter/material.dart';
import 'package:sports_app/generated/l10n.dart';
import 'package:sports_app/screens/countriesScreen.dart';
import 'package:sports_app/utils/colors.dart';
import 'package:sports_app/widgets/category/sports_categorywidget.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;
  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (category.name == "Foot Ball") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CountriesScreen()),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: thirdColor,
              title:  Text(S.of(context).dialogTitle,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              content:  Text(
                S.of(context).dialogContent,
                style: TextStyle(
                    fontSize: 15,
                    color: secondaryColor,
                    fontWeight: FontWeight.bold),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child:  Text(S.of(context).dialogAction
                    ,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                ),
              ],
            ),
          );
        }
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                category.image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black54, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
