import 'package:flutter/material.dart';
import 'package:sports_app/generated/l10n.dart';

class LanguageDialog extends StatelessWidget {
  final Function(Locale) setLocale;

  const LanguageDialog({required this.setLocale, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).language),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('English'),
            onTap: () {
              setLocale(const Locale('en'));
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text('العربية'),
            onTap: () {
              setLocale(const Locale('ar'));
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
