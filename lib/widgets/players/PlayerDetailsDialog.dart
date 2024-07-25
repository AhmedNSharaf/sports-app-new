import 'package:flutter/material.dart';
import 'package:sports_app/data/models/PlayersData.dart';
import 'package:sports_app/utils/colors.dart';
import 'package:share_plus/share_plus.dart';

class PlayerDetailsDialog extends StatelessWidget {
  final Result player;

  const PlayerDetailsDialog({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(width: 5),
              Text(
                'Yellow Cards: ${player.playerYellowCards ?? 'N/A'}',
                style: const TextStyle(color: secondaryColor),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Container(
                color: Colors.red,
                child: const SizedBox(
                  height: 18,
                  width: 13,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                'Red Cards: ${player.playerRedCards ?? 'N/A'}',
                style: const TextStyle(color: secondaryColor),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Container(
                color: secondaryColor,
                height: 20,
                width: 20,
                child: Image.asset('assets/icons/goal.png'),
              ),
              const SizedBox(width: 2),
              Text(
                'Goals: ${player.playerGoals ?? 'N/A'}',
                style: const TextStyle(color: secondaryColor),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Container(
                color: secondaryColor,
                height: 20,
                width: 20,
                child: Image.asset('assets/icons/football.png'),
              ),
              const SizedBox(width: 2),
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
  }
}
