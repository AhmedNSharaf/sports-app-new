import 'package:flutter/material.dart';
import 'package:sports_app/data/models/PlayersData.dart';
import 'package:sports_app/data/reposetories/PlayersRepo.dart';
import 'package:sports_app/utils/colors.dart';
import 'package:sports_app/screens/drawer.dart';
import 'package:share_plus/share_plus.dart';

class PlayersScreen extends StatefulWidget {
  final int teamId;

  const PlayersScreen({super.key, required this.teamId});

  @override
  PlayersScreenState createState() => PlayersScreenState();
}

class PlayersScreenState extends State<PlayersScreen> {
  late Future<PlayersData> futurePlayersData;
  late TextEditingController _searchController;
  List<Result> players = [];
  List<Result> filteredPlayers = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    futurePlayersData = PlayersRepo().fetchPlayersData(widget.teamId);

    // Fetch players data initially and set the lists
    futurePlayersData.then((data) {
      setState(() {
        players = data.result;
        filteredPlayers = players;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterPlayers(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPlayers = players;
      } else {
        filteredPlayers = players
            .where((player) =>
                player.playerName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _showPlayerDetails(Result player) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: primaryColor,
          title: Text(
            player.playerName,
            style: const TextStyle(color: secondaryColor),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (player.playerImage != null && player.playerImage!.isNotEmpty)
                Image.network(
                  player.playerImage!,
                  height: 100,
                  width: 100,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error, color: secondaryColor);
                  },
                )
              else
                const Icon(Icons.person, color: secondaryColor, size: 100),
              const SizedBox(height: 10),
              Text(
                'Player Number: ${player.playerNumber ?? 'N/A'}',
                style: const TextStyle(color: secondaryColor),
              ),
              Text(
                'Country: ${player.playerCountry ?? 'N/A'}',
                style: const TextStyle(color: secondaryColor),
              ),
              Text(
                'Position: ${player.playerType}',
                style: const TextStyle(color: secondaryColor),
              ),
              Text(
                'Age: ${player.playerAge ?? 'N/A'}',
                style: const TextStyle(color: secondaryColor),
              ),
              Row(
                children: [
                  Container(
                    color: Colors.yellow,
                    child: const SizedBox(
                      height: 18,
                      width: 13,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Yellow Cards: ${player.playerYellowCards ?? 'N/A'}',
                    style: const TextStyle(color: secondaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Container(
                    color: Colors.red,
                    child: const SizedBox(
                      height: 18,
                      width: 13,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Red Cards: ${player.playerRedCards ?? 'N/A'}',
                    style: const TextStyle(color: secondaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Container(
                    color: secondaryColor,
                    height: 20,
                    width: 20,
                    child: Image.asset('assets/icons/goal.png'),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Goals: ${player.playerGoals ?? 'N/A'}',
                    style: const TextStyle(color: secondaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  Container(
                    color: secondaryColor,
                    height: 20,
                    width: 20,
                    child: Image.asset('assets/icons/football.png'),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Assists: ${player.playerAssists ?? 'N/A'}',
                    style: const TextStyle(color: secondaryColor),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Share'),
              onPressed: () {
                final shareContent =
                    'Player Name : ${player.playerName} \nFrom : ${player.playerCountry} \nplays For : ${player.teamName}';
                Share.share(shareContent);
              },
            ),
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
                FocusScope.of(context).unfocus();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        drawer:
            AppDrawer(phoneNumber: '1234567890'), // Pass user phone number here
        backgroundColor: primaryColor,
        appBar: AppBar(
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
          title: const Text(
            'Players',
            style:
                TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search for a player',
                  hintStyle: const TextStyle(color: secondaryColor),
                  prefixIcon: const Icon(Icons.search, color: secondaryColor),
                  filled: true,
                  fillColor: thirdColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: _filterPlayers,
              ),
            ),
            Expanded(
              child: FutureBuilder<PlayersData>(
                future: futurePlayersData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                        child: Text('Failed to load players data'));
                  } else if (!snapshot.hasData ||
                      snapshot.data!.result.isEmpty) {
                    return const Center(child: Text('No players available'));
                  } else {
                    // Only update players list if it is empty
                    if (players.isEmpty) {
                      players = snapshot.data!.result;
                      filteredPlayers = players;
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.all(5),
                      itemCount: filteredPlayers.length,
                      itemBuilder: (context, index) {
                        var player = filteredPlayers[index];
                        return Card(
                          color: thirdColor,
                          elevation: 5,
                          child: ListTile(
                              leading: player.playerImage != null &&
                                      player.playerImage!.isNotEmpty
                                  ? Image.network(
                                      player.playerImage!,
                                      height: 50,
                                      width: 50,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.error,
                                            color: secondaryColor);
                                      },
                                    )
                                  : const Icon(Icons.person,
                                      color: secondaryColor, size: 50),
                              title: Text(
                                player.playerName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: secondaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                player.playerType,
                                style: const TextStyle(color: secondaryColor),
                              ),
                              onTap: () {
                                FocusScope.of(context).unfocus();

                                _showPlayerDetails(player);
                              }),
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
