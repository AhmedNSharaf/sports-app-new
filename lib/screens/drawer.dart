import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/generated/l10n.dart';
import 'package:sports_app/main.dart';
import 'package:sports_app/screens/LoginScreen.dart';
import 'package:sports_app/utils/colors.dart';
import 'package:sports_app/widgets/Drawer/CustomListWidget.dart';

class AppDrawer extends StatefulWidget {
  final String? phoneNumber;

  AppDrawer({this.phoneNumber});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DefaultTabController(
        length: 2, // Number of tabs
        child: Column(
          children: [
            // Drawer Header
            UserAccountsDrawerHeader(
              accountName: widget.phoneNumber != null
                  ? Text('${S.of(context).welcom} :\n${user.email}')
                  : const Text('Guest'),
              accountEmail: null,
              currentAccountPicture: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              decoration: const BoxDecoration(
                color: primaryColor,
              ),
            ),

            // Tab Bar
            TabBar(
              labelColor: primaryColor,
              indicatorColor: primaryColor,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: S.of(context).homeTab,
                ),
                Tab(
                  icon: Icon(Icons.person),
                  text: S.of(context).myAccountTap,
                ),
              ],
            ),
            // Tab Bar View
            Expanded(
              child: TabBarView(
                children: [
                  // Home Tab
                  Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: secondaryColor,
                          child: SizedBox(
                              height: 30,
                              width: 30,
                              child:
                                  Image.asset('assets/icons/home-button.png')),
                        ),
                        title: Text(
                          S.of(context).homeTab,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          // Navigate to Home
                          Navigator.pop(context); // Close the drawer
                        },
                      ),
                      CustomListItem(
                        imagePath: 'assets/icons/facebook.png',
                        text: S.of(context).facebookName,
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/youtube.png',
                        text: S.of(context).youtubeName,
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/instagram.png',
                        text: S.of(context).instagramName,
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/logo.png',
                        text: S.of(context).whatsAppName,
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/twitter.png',
                        text: S.of(context).XName,
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/telegram (1).png',
                        text: S.of(context).TelegramName,
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/next.png',
                        text: S.of(context).ShareAppName,
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/contact-us (1).png',
                        text: S.of(context).ContactUsName,
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/privacy-policy.png',
                        text: S.of(context).PrivacyPoliciName,
                      ),
                      const Spacer(
                        flex: 15,
                      ),
                    ],
                  ),
                  // Settings Tab
                  Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                            backgroundColor: secondaryColor,
                            child: Icon(Icons.settings)),
                        title: Text(
                          S.of(context).SettingsName,
                          style: TextStyle(fontSize: 20),
                        ),
                        onTap: () {
                          // Navigate to Settings
                          Navigator.pop(context); // Close the drawer
                        },
                      ),
                      ListTile(
                        title: PopupMenuButton<String>(
                          onSelected: (String value) {
                            if (value == 'en') {
                              (context.findAncestorStateOfType<MyAppState>())
                                  ?.setLocale(const Locale('en'));
                            } else if (value == 'ar') {
                              (context.findAncestorStateOfType<MyAppState>())
                                  ?.setLocale(const Locale('ar'));
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'en',
                              child: Text('English'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'ar',
                              child: Text('العربية'),
                            ),
                          ],
                          child: Row(
                            children: [
                              CircleAvatar(
                                  backgroundColor: secondaryColor,
                                  child: Icon(Icons.language,
                                      color: primaryColor)),
                              SizedBox(width: 16),
                              Text(
                                S.of(context).language,
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: FirebaseAuth.instance.signOut,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3,
                            ),
                            CircleAvatar(
                                backgroundColor: secondaryColor,
                                child: Icon(Icons.logout)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              S.of(context).Signout,
                              style:
                                  TextStyle(fontSize: 20, color: primaryColor),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
