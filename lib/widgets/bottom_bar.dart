import 'package:coffee_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:provider/provider.dart';

import '../features/screen/home_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> with SingleTickerProviderStateMixin {
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
        ),
        body: BottomBar(
          clip: Clip.hardEdge,
          barColor: themeProvider.themeData.primaryColorDark,
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
            indicator: const BoxDecoration(),
            overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
            indicatorColor: Colors.transparent,
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
      height: MediaQuery.of(context).size.height * 0.065,
      child: Center(
        child: Icon(
          size: isSelected?MediaQuery.of(context).size.height * 0.043:MediaQuery.of(context).size.height * 0.033,
          isSelected?selectedIcon:unSelectedIcon,
          color: isSelected
              ? themeProvider.themeData.bottomNavigationBarTheme.selectedItemColor
              : themeProvider.themeData.bottomNavigationBarTheme.unselectedItemColor,
        ),
      ),
    );
  }

}