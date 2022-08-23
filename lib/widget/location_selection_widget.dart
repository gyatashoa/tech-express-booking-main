import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LocationSelection extends SearchDelegate<String> {
  List<String> locations;
  LocationSelection({required this.locations}) {
    locations.sort();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {}, icon: const Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  void onTileTapped(String location, BuildContext context) {
    Navigator.pop(context, location);
  }

  @override
  Widget buildResults(BuildContext context) {
    var results =
        locations.where((element) => element.contains(query)).toList();
    if (results.isEmpty) {
      return Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset('assets/lotties/no_location.json'),
              const Text('No location found with the given name'),
            ],
          ),
        ),
      );
    }
    return ListView.builder(
        itemCount: results.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => ListTile(
              title: Text(results[index]),
              onTap: () => onTileTapped(results[index], context),
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var results = locations
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    if (results.isEmpty) {
      return Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset('assets/lotties/no_location.json'),
              const Text('No location found with the given name'),
            ],
          ),
        ),
      );
    }
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: results.length,
        itemBuilder: (_, index) => ListTile(
              leading: const Icon(Icons.location_city),
              title: Text(results[index]),
              onTap: () => onTileTapped(results[index], context),
            ));
  }
}
