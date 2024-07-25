import 'package:flutter/material.dart';
import 'package:sports_app/data/models/TeamsData.dart';
import 'package:sports_app/data/reposetories/TeamsRepo.dart';
import 'package:sports_app/screens/PlayersScreen.dart';
import 'package:sports_app/utils/colors.dart';
import 'package:sports_app/screens/drawer.dart';

class TeamsScreen extends StatefulWidget {
  final int leagueId;

  const TeamsScreen({super.key, required this.leagueId});

  @override
  TeamsScreenState createState() => TeamsScreenState();
}

class TeamsScreenState extends State<TeamsScreen> {
  late Future<TeamsData> futureTeamsData;
  late TextEditingController _searchController;
  List<Result> teams = [];
  List<Result> filteredTeams = [];
  bool _showClearIcon = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    futureTeamsData = TeamsRepo().fetchTeamsData(widget.leagueId);

    futureTeamsData.then((data) {
      setState(() {
        teams = data.result;
        filteredTeams = teams;
      });
    });

    _searchController.addListener(() {
      setState(() {
        _showClearIcon = _searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterTeams(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTeams = teams;
      } else {
        filteredTeams = teams
            .where((team) =>
                team.teamName!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:
          AppDrawer(phoneNumber: '1234567890'), // Pass user phone number here
      backgroundColor: primaryColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextField(
                    controller: _searchController,
                    style: const TextStyle(
                        color: secondaryColor), // Change text color here
                    decoration: InputDecoration(
                      hintText: 'Search for a team',
                      hintStyle: const TextStyle(color: secondaryColor),
                      prefixIcon:
                          const Icon(Icons.search, color: secondaryColor),
                      filled: true,
                      fillColor: thirdColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: _filterTeams,
                  ),
                  if (_showClearIcon)
                    IconButton(
                      icon: const Icon(Icons.clear, color: secondaryColor),
                      onPressed: () {
                        _searchController.clear();
                        _filterTeams('');
                      },
                    ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<TeamsData>(
                future: futureTeamsData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                        child: Text('Failed to load teams data'));
                  } else if (!snapshot.hasData ||
                      snapshot.data!.result.isEmpty) {
                    return const Center(child: Text('No teams available'));
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 4.2 / 5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      padding: const EdgeInsets.all(5),
                      itemCount: filteredTeams.length,
                      itemBuilder: (context, index) {
                        var team = filteredTeams[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PlayersScreen(teamId: team.teamKey),
                              ),
                            );
                          },
                          child: Card(
                            color: thirdColor,
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (team.teamLogo != null &&
                                    team.teamLogo!.isNotEmpty)
                                  Image.network(
                                    team.teamLogo!,
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
                                  team.teamName ?? 'No Name',
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
            ),
          ],
        ),
      ),
    );
  }
}
