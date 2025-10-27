import 'package:coffee_app/features/home/home_screen.dart';
import 'package:coffee_app/providers/theme_provider.dart';
import 'package:coffee_app/widgets/carousel_widget.dart';
import 'package:coffee_app/widgets/coffee_cards/item_coffee_card.dart';
import 'package:coffee_app/widgets/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:provider/provider.dart';

import '../../widgets/coffee_cards/new_coffee_card.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 3, vsync: this);
    tabController.animation!.addListener(
          () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.black,
        ),
        body: BottomBar(
          clip: Clip.hardEdge,
          iconDecoration: BoxDecoration(
            color: themeProvider.themeData.primaryColorLight,
          ),
          barColor: themeProvider.themeData.primaryColorDark,
          fit: StackFit.loose,
          borderRadius: BorderRadius.circular(500),
          duration: Duration(seconds: 1),
          width: MediaQuery.of(context).size.width * 0.8,
          barAlignment: Alignment.bottomCenter,
          respectSafeArea: true,
          body: (context, controller) => TabBarView(
            controller: tabController,
            children: [
              HomePage(),
              HomePage(),
              HomePage()
            ],
          ),
          child: TabBar(
            controller: tabController,
            tabs: [
              _buildTabIcon(selectedIcon: Icons.home, index: 0, themeProvider: themeProvider, unSelectedIcon: Icons.home_filled),
              _buildTabIcon(selectedIcon: Icons.search, index: 1, themeProvider: themeProvider, unSelectedIcon: Icons.search_rounded),
              _buildTabIcon(selectedIcon: Icons.person, index: 2, themeProvider: themeProvider, unSelectedIcon: Icons.perm_identity_outlined),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabIcon({
    required IconData selectedIcon,
    required IconData unSelectedIcon,
    required int index,
    required ThemeProvider themeProvider,
  }) {
    final isSelected = currentPage == index;
    return SizedBox(
      height: 55,
      child: Center(
        child: Icon(
          size: isSelected?40:35,
          isSelected?selectedIcon:unSelectedIcon,
          color: isSelected
              ? themeProvider.themeData.bottomNavigationBarTheme.selectedItemColor
              : themeProvider.themeData.bottomNavigationBarTheme.unselectedItemColor,
        ),
      ),
    );
  }

}