import 'package:flutter/material.dart';
import 'package:search_gifs_flutter/delegate/custom_search_delegate.dart';

import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gifs'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showSearch(
            context: context, 
            delegate: CustomSearchDelegate(homeController: homeController)), 
          icon: const Icon(Icons.search))
        ],
      ),
      body: FutureBuilder(
          future: homeController.getGifs(null),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapShot.data!.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(snapShot.data![index].gif),
                  );
                }),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
