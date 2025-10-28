import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();

    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.brightness_6),
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
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications"),
            trailing: Switch(
              activeThumbColor: themeProvider.themeData
                  .brightness == Brightness.dark?themeProvider.themeData.primaryColorLight: themeProvider.themeData.primaryColorDark,
              value: true,
              onChanged: (bool value) {

              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
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
