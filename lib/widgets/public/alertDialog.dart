// import 'package:flutter/material.dart';
// import 'package:sports_app/utils/colors.dart';

// class CustomAlertDialog extends StatelessWidget {
//   final String title;
//   final String content;
//   final VoidCallback onOkPressed;

//   CustomAlertDialog({
//     required this.title,
//     required this.content,
//     required this.onOkPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: primaryColor, // Set the background color here
//       title: Text(
//         title,
//         style: TextStyle(
//             fontSize: 25, fontWeight: FontWeight.bold, color: secondaryColor),
//       ),
//       content: Text(
//         content,
//         style: TextStyle(
//             fontSize: 15,
//             color: secondaryColor, // Set the text color
//             fontWeight: FontWeight.bold),
//       ),
//       actions: [
//         TextButton(
//           onPressed: onOkPressed,
//           child: Text(
//             'OK',
//             style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//                 color: thirdColor // Set the button text color
//                 ),
//           ),
//         ),
//       ],
//     );
//   }
// }
