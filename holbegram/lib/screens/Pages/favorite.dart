// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10, // Number of saved images you want to display
          itemBuilder: (BuildContext context, int index) => Container(
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage('https://via.placeholder.com/200x200'), // Replace with actual image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
