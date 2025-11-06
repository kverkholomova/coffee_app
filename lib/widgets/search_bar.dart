import 'package:flutter/material.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchAnchor(
            viewSurfaceTintColor: Theme.of(context).cardColor,
            viewBackgroundColor: Theme.of(context).cardColor,
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                elevation: WidgetStatePropertyAll(0),
                side: WidgetStateProperty.all<BorderSide>(BorderSide(
                  color: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorDark:Theme.of(context).primaryColorLight,
                )),
                backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).cardColor),

                controller: controller,
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0),
                ),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
              );
            },
            suggestionsBuilder: (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            },
          ),
        );
  }
}