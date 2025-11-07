import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();

    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.brightness_6, color: themeProvider.themeData.primaryIconTheme.color,),
            title: const Text("Theme"),
            onTap: () {
              themeProvider.setTheme(
                themeProvider.themeData
                    .brightness == Brightness.dark
                    ? AppTheme.light
                    : AppTheme.dark,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: themeProvider.themeData.primaryIconTheme.color),
            title: const Text("Notifications"),
            trailing: Switch(
              trackOutlineColor: WidgetStateProperty.all<Color>(themeProvider.themeData
                  .brightness == Brightness.dark?themeProvider.themeData.primaryColorLight: themeProvider.themeData.primaryColorDark),
              activeThumbColor: themeProvider.themeData
                  .brightness == Brightness.dark?themeProvider.themeData.primaryColorLight: themeProvider.themeData.primaryColorDark,
              value: light,
              inactiveTrackColor: themeProvider.themeData
                  .brightness == Brightness.dark?themeProvider.themeData.primaryColorDark: themeProvider.themeData.primaryColorLight,
              inactiveThumbColor: themeProvider.themeData
                  .brightness == Brightness.dark?themeProvider.themeData.primaryColorLight: themeProvider.themeData.primaryColorDark,
              onChanged: (bool value) {

                setState(() {
                  light = value;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.language, color: themeProvider.themeData.primaryIconTheme.color),
            title: const Text("Language"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              // Handle language selection
            },
          ),
        ],
      ),
    );
  }
}
