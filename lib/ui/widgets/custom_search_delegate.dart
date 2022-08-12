import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<dynamic> items;

  CustomSearchDelegate(this.items);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView(
        children: items
            .where((element) => element.contains(query))
            .map((e) => ListTile(
                  title: Text(e),
                  onTap: () => close(context, e),
                ))
            .toList());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
        children: items
            .map((e) => ListTile(
          title: Text(e),
          onTap: () => close(context, e),
        ))
            .toList());
  }
}
