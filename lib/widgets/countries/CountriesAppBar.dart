import 'package:flutter/material.dart';
import 'package:sports_app/utils/colors.dart';
import 'package:sports_app/screens/drawer.dart';

class CountriesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function onLocationButtonPressed;

  const CountriesAppBar({required this.onLocationButtonPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: secondaryColor),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: secondaryColor),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: primaryColor,
      centerTitle: true,
      title: const Text(
        'Countries',
        style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.location_on, color: secondaryColor),
          onPressed: () => onLocationButtonPressed(),
        ),
        Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: secondaryColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
