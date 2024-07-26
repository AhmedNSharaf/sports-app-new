import 'package:flutter/material.dart';
import 'package:sports_app/generated/l10n.dart';
import 'package:sports_app/utils/colors.dart';
import 'package:sports_app/widgets/category/category_widget.dart';
import 'package:sports_app/screens/drawer.dart';
import 'package:sports_app/widgets/category/sports_categorywidget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: AppDrawer(phoneNumber: S.of(context).drawerPhone),
      appBar: AppBar(
        backgroundColor: primaryColor,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).categoryTitle,
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
            childAspectRatio: 2.3 / 4,
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
