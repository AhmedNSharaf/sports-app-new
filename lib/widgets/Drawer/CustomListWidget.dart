import 'package:flutter/material.dart';
import 'package:sports_app/utils/colors.dart';

class CustomListItem extends StatefulWidget {
  final String imagePath;
  final String text;

  CustomListItem({
    required this.imagePath,
    required this.text,
  });

  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _alert();
      },
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          CircleAvatar(
            backgroundColor: secondaryColor,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(widget.imagePath),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _alert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: thirdColor, // Set the background color here
        title: const Text(
          'Coming Soon',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: primaryColor),
        ),
        content: const Text(
          'This feature is coming soon.',
          style: TextStyle(
              fontSize: 15,
              color: secondaryColor, // Set the text color
              fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'OK',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: primaryColor // Set the button text color
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
