import 'package:flutter/material.dart';
import 'package:sports_app/data/models/PlayersData.dart';
import 'package:sports_app/utils/colors.dart';

class PlayerCard extends StatelessWidget {
  final Result player;
  final Function(Result) onTap;

  const PlayerCard({super.key, required this.player, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: thirdColor,
      elevation: 5,
      child: ListTile(
        leading: player.playerImage != null && player.playerImage!.isNotEmpty
            ? Image.network(
                player.playerImage!,
                height: 50,
                width: 50,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, color: secondaryColor);
                },
              )
            : const Icon(Icons.person, color: secondaryColor, size: 50),
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
        onTap: () => onTap(player),
      ),
    );
  }
}
