import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:sports_app/data/models/CountriesData.dart';
import 'package:sports_app/data/reposetories/CountriesRepo.dart';
import 'package:sports_app/screens/leagusScreen.dart';
import 'package:sports_app/utils/colors.dart';
//import 'package:sports_app/widgets/countries/location_provider.dart';
import 'package:sports_app/widgets/drawer.dart';

class LocationProvider with ChangeNotifier {
  Position? _currentPosition;
  String? _currentCountryName;

  Position? get currentPosition => _currentPosition;
  String? get currentCountryName => _currentCountryName;

  Future<void> getCurrentLocation() async {
    try {
      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      notifyListeners();

      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );

      if (placemarks.isNotEmpty) {
        _currentCountryName = placemarks.first.country;
        print("Detected country: $_currentCountryName");
        notifyListeners();
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }
}

class CountriesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final LocationProvider locationProvider;
  final Function onLocationButtonPressed;

  CountriesAppBar(
      {required this.locationProvider, required this.onLocationButtonPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          icon: const Icon(
            Icons.location_on,
            color: Color(0xffFFFFFF),
          ),
          onPressed: () => onLocationButtonPressed(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CountriesScreen extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  late Future<CountriesData> futureCountriesData;
  late ScrollController _scrollController;
  double _itemHeight = 220.0; // Adjust based on your item height
  late List<Result> countries;

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
    print("Scrolling to country: $countryName");
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
    } else {
      print("Country not found: $countryName");
    }
  }

  bool isCountryCurrentLocation(Result country) {
    final currentCountryName =
        Provider.of<LocationProvider>(context, listen: false)
            .currentCountryName;
    print(
        "Current Country: $currentCountryName, Checking against: ${country.countryName}");
    return country.countryName == currentCountryName;
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    return Scaffold(
      drawer:
          AppDrawer(phoneNumber: '1234567890'), // Pass user phone number here
      backgroundColor: primaryColor,
      appBar: CountriesAppBar(
        locationProvider: locationProvider,
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
                  return const Center(
                      child: Text(
                    'Failed to load countries data',
                    style: TextStyle(color: secondaryColor),
                  ));
                } else if (!snapshot.hasData || snapshot.data!.result.isEmpty) {
                  return const Center(child: Text('No countries available'));
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
                      return GestureDetector(
                        onTap: () {
                          if (country.countryName != 'Israel')
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LeaguesScreen(
                                    countryKey: country.countryKey),
                              ),
                            );
                          else
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: thirdColor,
                                title: Text(
                                  'Coming Soon',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                                ),
                                content: Text(
                                  'Palestine leagues are coming soon.',
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
                                      'OK',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            );
                        },
                        child: Card(
                          color: thirdColor,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                color: locationProvider.currentPosition != null && isCountryCurrentLocation(country)
                                    ? Colors.green // Special color for current location
                                    : Colors.grey, // Default color
                                width: 2,
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
                                  height: 50,
                                  width: 50,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.error,
                                        color: secondaryColor);
                                  },
                                )
                              else
                                const Icon(Icons.flag,
                                    color: secondaryColor, size: 50),
                              const SizedBox(height: 10),
                              if (country.countryName == 'Israel')
                                Text(
                                  'Free\nPalestine',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
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
