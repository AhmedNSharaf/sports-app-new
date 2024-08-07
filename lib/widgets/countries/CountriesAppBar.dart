import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/generated/l10n.dart';
import 'package:sports_app/utils/colors.dart';
import 'package:sports_app/main.dart'; // Import MyApp to access setLocale

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
      title: Text(
        S.of(context).countriesTitle,
        style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.location_on, color: secondaryColor),
          onPressed: () => onLocationButtonPressed(),
        ),
        // PopupMenuButton<String>(
        //   onSelected: (String value) {
        //     if (value == 'en') {
        //       (context.findAncestorStateOfType<MyAppState>())?.setLocale(const Locale('en'));
        //     } else if (value == 'ar') {
        //       (context.findAncestorStateOfType<MyAppState>())?.setLocale(const Locale('ar'));
        //     }
        //   },
        //   itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        //     const PopupMenuItem<String>(
        //       value: 'en',
        //       child: Text('English'),
        //     ),
        //     const PopupMenuItem<String>(
        //       value: 'ar',
        //       child: Text('العربية'),
        //     ),
        //   ],
        //   icon: const Icon(Icons.language, color: secondaryColor),
        // ),
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
