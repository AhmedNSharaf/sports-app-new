import 'package:flutter/material.dart';
import 'package:sports_app/data/models/PlayersData.dart';
import 'package:sports_app/data/reposetories/PlayersRepo.dart';
import 'package:sports_app/utils/colors.dart';
import 'package:sports_app/screens/drawer.dart';
import 'package:sports_app/widgets/players/PlayerCard.dart';
import 'package:sports_app/widgets/players/PlayerDetailsDialog.dart';

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
  bool _showClearIcon = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    futurePlayersData = PlayersRepo().fetchPlayersData(widget.teamId);

    futurePlayersData.then((data) {
      setState(() {
        players = data.result;
        filteredPlayers = players;
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
        return PlayerDetailsDialog(player: player);
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
              FocusScope.of(context).unfocus();
            },
          ),
          actions: [
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
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextField(
                    controller: _searchController,
                    style: const TextStyle(color: secondaryColor),
                    decoration: InputDecoration(
                      hintText: 'Search for a player',
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
                    onChanged: _filterPlayers,
                  ),
                  if (_showClearIcon)
                    IconButton(
                      icon: const Icon(Icons.clear, color: secondaryColor),
                      onPressed: () {
                        _searchController.clear();
                        _filterPlayers('');
                      },
                    ),
                ],
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
                    if (players.isEmpty) {
                      players = snapshot.data!.result;
                      filteredPlayers = players;
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.all(5),
                      itemCount: filteredPlayers.length,
                      itemBuilder: (context, index) {
                        var player = filteredPlayers[index];
                        return PlayerCard(
                          player: player,
                          onTap: _showPlayerDetails,
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
