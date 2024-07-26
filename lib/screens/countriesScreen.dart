import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/data/models/CountriesData.dart';
import 'package:sports_app/data/reposetories/CountriesRepo.dart';
import 'package:sports_app/generated/l10n.dart';
import 'package:sports_app/utils/colors.dart';
import 'package:sports_app/screens/drawer.dart';
import 'package:sports_app/widgets/countries/CountriesAppBar.dart';
import 'package:sports_app/widgets/countries/countryCard.dart';
import 'package:sports_app/widgets/countries/location_provider.dart';

class CountriesScreen extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  late Future<CountriesData> futureCountriesData;
  late ScrollController _scrollController;
  double _itemHeight = 220.0; // Adjust based on your item height
  List<Result> countries = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    futureCountriesData = CountriesRepo().fetchCountriesData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToCountry(String countryName) {
    final index =
        countries.indexWhere((country) => country.countryName == countryName);
    if (index != -1) {
      final int row =
          (index / 2).floor(); // 2 is the number of columns in the grid
      final double targetOffset = row * _itemHeight;
      _scrollController.animateTo(
        targetOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  bool isCountryCurrentLocation(Result country) {
    final currentCountryName =
        Provider.of<LocationProvider>(context, listen: false)
            .currentCountryName;
    return country.countryName == currentCountryName;
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    return Scaffold(
      drawer: AppDrawer(
          phoneNumber:
              S.of(context).drawerPhone), // Pass user phone number here
      backgroundColor: primaryColor,
      appBar: CountriesAppBar(
        onLocationButtonPressed: () async {
          await locationProvider.getCurrentLocation();
          if (locationProvider.currentCountryName != null) {
            scrollToCountry(locationProvider.currentCountryName!);
          }
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (locationProvider.currentPosition != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Current Location: ${locationProvider.currentPosition!.latitude}, ${locationProvider.currentPosition!.longitude}\nCountry: ${locationProvider.currentCountryName ?? "Unknown"}',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          Expanded(
            child: FutureBuilder<CountriesData>(
              future: futureCountriesData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      S.of(context).Failedtoloadcountriesdata,
                      style: TextStyle(color: secondaryColor),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.result.isEmpty) {
                  return  Center(child: Text(S.of(context).NoCountriesAvailable));
                } else {
                  countries = snapshot.data!.result;
                  return GridView.builder(
                    controller: _scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4.2 / 5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    padding: const EdgeInsets.all(5),
                    itemCount: countries.length,
                    itemBuilder: (context, index) {
                      var country = countries[index];
                      return CountryCard(
                        country: country,
                        isCurrentLocation: isCountryCurrentLocation(country),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
