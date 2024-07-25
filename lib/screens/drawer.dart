import 'package:flutter/material.dart';
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
                  ? Text('Phone: ${widget.phoneNumber}')
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
            const TabBar(
              labelColor: primaryColor,
              indicatorColor: primaryColor,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.person),
                  text: 'My Account',
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
                        title: const Text(
                          'Home',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          // Navigate to Home
                          Navigator.pop(context); // Close the drawer
                        },
                      ),
                      CustomListItem(
                        imagePath: 'assets/icons/facebook.png',
                        text: 'Facebook',
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/youtube.png',
                        text: 'Youtube',
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/instagram.png',
                        text: 'Instagram',
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/logo.png',
                        text: 'WhatsApp',
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/twitter.png',
                        text: 'X',
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/telegram (1).png',
                        text: 'Telegram',
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/next.png',
                        text: 'Share App',
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/contact-us (1).png',
                        text: 'Contact Us',
                      ),
                      const Spacer(),
                      CustomListItem(
                        imagePath: 'assets/icons/privacy-policy.png',
                        text: 'Privacy Polici',
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
                        title: const Text('Settings'),
                        onTap: () {
                          // Navigate to Settings
                          Navigator.pop(context); // Close the drawer
                        },
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                            backgroundColor: secondaryColor,
                            child: Icon(Icons.logout)),
                        title: const Text(
                          'Log Out',
                          style: TextStyle(color: primaryColor, fontSize: 20),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          ); // Adjust route name as needed
                        },
                      ),
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
