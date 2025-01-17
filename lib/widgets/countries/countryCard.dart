import 'package:flutter/material.dart';
import 'package:sports_app/data/models/CountriesData.dart';
import 'package:sports_app/generated/l10n.dart';
import 'package:sports_app/utils/colors.dart';
import 'package:sports_app/screens/leagusScreen.dart';

class CountryCard extends StatelessWidget {
  final Result country;
  final bool isCurrentLocation;

  const CountryCard({required this.country, required this.isCurrentLocation});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (country.countryName != 'Israel') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  LeaguesScreen(countryKey: country.countryKey),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: thirdColor,
              title: Text(
                S.of(context).dialogTitle,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              content: Text(
                S.of(context).palestineDialogContent,
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
                  child: Text(
                    S.of(context).dialogAction,
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
        color: thirdColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: isCurrentLocation
                ? Colors.green // Special color for current location
                : Colors.grey, // Default color
            width: isCurrentLocation ? 4 : 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (country.countryLogo != null &&
                country.countryLogo!.isNotEmpty &&
                country.countryName != 'Israel')
              Image.network(
                country.countryLogo!,
                height: 70,
                width: 70,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, color: secondaryColor);
                },
              )
            else
              const Icon(Icons.flag, color: secondaryColor, size: 50),
            const SizedBox(height: 10),
            if (country.countryName == 'Israel')
              Text(
                S.of(context).palestineCardContent,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              )
            else
              Text(
                country.countryName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16,
                    color: secondaryColor,
                    fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
