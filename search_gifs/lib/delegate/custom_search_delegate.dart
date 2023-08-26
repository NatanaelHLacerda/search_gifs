import 'package:flutter/material.dart';
import 'package:search_gifs_flutter/controller/home_controller.dart';

class CustomSearchDelegate extends SearchDelegate {
  HomeController homeController = HomeController();

  CustomSearchDelegate({required this.homeController});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: homeController.getGifs(query),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapShot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(snapShot.data![index].gif),
                  );
                });
          } else {
            return Container();
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
