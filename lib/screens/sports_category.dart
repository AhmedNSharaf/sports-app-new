import 'package:flutter/material.dart';
import 'package:sports_app/screens/countriesScreen.dart';
import 'package:sports_app/utils/colors.dart';
import 'package:sports_app/widgets/category/sports_categorywidget.dart';
import 'package:sports_app/screens/drawer.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer:
          AppDrawer(phoneNumber: '1234567890'), // Pass user phone number here

      appBar: AppBar(
        backgroundColor: primaryColor,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          'Sports Category',
          style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: secondaryColor),
      ),

      body: Container(
        margin: const EdgeInsets.only(top: 25),
        color: primaryColor,
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(6),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.3 / 4, // Adjust aspect ratio as needed
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryWidget(category: categories[index]);
          },
        ),
      ),
    );
  }
}

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
              backgroundColor: thirdColor, // Set the background color here
              title: const Text(
                'Coming Soon',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              content: const Text(
                'This feature is coming soon.',
                style: TextStyle(
                    fontSize: 15,
                    color: secondaryColor, // Set the text color
                    fontWeight: FontWeight.bold),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: primaryColor // Set the button text color
                        ),
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
        clipBehavior:
            Clip.antiAlias, // This will clip the image to the rounded corners
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                category.image,
                fit: BoxFit.cover, // Make the image cover the entire card
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
