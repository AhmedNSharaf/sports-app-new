import 'package:flutter/material.dart';
import 'package:sports_app/data/models/LeagueData.dart';
import 'package:sports_app/data/reposetories/LeagusRepo.dart';
import 'package:sports_app/generated/l10n.dart';
import 'package:sports_app/screens/TeamsScreen.dart';
import 'package:sports_app/screens/TopScorersScreen.dart';
import 'package:sports_app/utils/colors.dart';
import 'package:sports_app/screens/drawer.dart';

class LeaguesScreen extends StatefulWidget {
  final int countryKey;

  LeaguesScreen({super.key, required this.countryKey});

  @override
  LeaguesScreenState createState() => LeaguesScreenState();
}

class LeaguesScreenState extends State<LeaguesScreen> {
  late Future<LeagueData> futureLeaguesData;

  @override
  void initState() {
    super.initState();
    futureLeaguesData = LeaguesRepo().fetchLeaguesData(widget.countryKey);
  }

  void _onLeagueSelected(int leagueId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DefaultTabController(
          length: 2,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              appBar: AppBar(
                iconTheme: const IconThemeData(color: secondaryColor),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: secondaryColor),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.menu, color: secondaryColor),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ],
                backgroundColor: primaryColor,
                centerTitle: true,
                title:  Text(S.of(context).LeagueDetails,
                  style: TextStyle(color: secondaryColor),
                ),
                bottom:  TabBar(
                  labelStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  labelColor: Colors
                      .white, // Change this to your desired color for selected tab text
                  //unselectedLabelColor: Colors
                  //    .grey, // Change this to your desired color for unselected tab text
                  unselectedLabelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey),
                  tabs: [
                    Tab(text: S.of(context).Teams),
                    Tab(text: S.of(context).TopScorers),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  TeamsScreen(leagueId: leagueId),
                  TopScorersScreen(leagueId: leagueId),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:
          AppDrawer(phoneNumber: S.of(context).drawerPhone), // Pass user phone number here

      backgroundColor: primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: secondaryColor),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: secondaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: secondaryColor),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
        backgroundColor: primaryColor,
        centerTitle: true,
        title:  Text(
          S.of(context).Leagues,
          style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<LeagueData>(
        future: futureLeaguesData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return  Center(
                child: Text(
              S.of(context).Failedtoloadleaguesdata,
              style: TextStyle(color: secondaryColor),
            ));
          } else if (!snapshot.hasData || snapshot.data!.result.isEmpty) {
            return  Center(
                child: Text(
              S.of(context).NoLeaguesAvailable,
              style: TextStyle(color: secondaryColor),
            ));
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4.2 / 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(5),
              itemCount: snapshot.data!.result.length,
              itemBuilder: (context, index) {
                var league = snapshot.data!.result[index];
                return Card(
                  color: thirdColor,
                  elevation: 5,
                  child: InkWell(
                    onTap: () {
                      _onLeagueSelected(league.leagueKey);
                      FocusScope.of(context).unfocus();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (league.leagueLogo != null &&
                            league.leagueLogo!.isNotEmpty)
                          Image.network(
                            league.leagueLogo!,
                            height: 50,
                            width: 50,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error,
                                  color: secondaryColor);
                            },
                          )
                        else
                          const Icon(Icons.sports_soccer,
                              color: secondaryColor, size: 50),
                        const SizedBox(height: 10),
                        Text(
                          league.leagueName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
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
    );
  }
}
