import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenet/core/services/geocoding.dart';
import 'package:safenet/ui/constants.dart';
import 'package:safenet/core/viewmodals/home_model.dart';

class SearchBar extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    GeoCoding geoCoding = GeoCoding();
    var cityData = geoCoding.getCityLocation(query).toString();
    return Text(cityData);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
