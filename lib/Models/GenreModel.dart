import 'package:flutter/material.dart';

class GenreModel {

  GenreModel({
    @required this.name,
    @required this.time,
    @required this.image,
  });

  final String name;
  final String time;
  final String image;

  List<GenreModel> searchByNameKeyword(String keyword, List<GenreModel> songsList) {
    List<GenreModel> suggestions = [];
    for (var i = 0; i < songsList.length; i++) {
      if (songsList[i].name.toUpperCase().contains(keyword.toUpperCase())) {
        suggestions.add(songsList[i]);
      }
    }
    return suggestions;
  }

}