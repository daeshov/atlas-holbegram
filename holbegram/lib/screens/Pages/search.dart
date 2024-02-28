import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 12, // Number of images you want to display
          itemBuilder: (BuildContext context, int index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: NetworkImage('https://via.placeholder.com/200x200'), // Replace with actual image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
      ),
    );
  }
}

class StaggeredTile {
  static count(int i, int j) {}
}

class StaggeredGridView {
  static countBuilder({required int crossAxisCount, required int itemCount, required Container Function(BuildContext context, int index) itemBuilder, required Function(int index) staggeredTileBuilder, required double mainAxisSpacing, required double crossAxisSpacing}) {}
}
