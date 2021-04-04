import 'package:flutter/material.dart';

class SongModel {
  SongModel({
    @required this.name,
    @required this.time,
    @required this.genre,
});

  final String name;
  final String time;
  final String genre;

  List<SongModel> searchByNameKeyword(String keyword, List<SongModel> songsList) {
    List<SongModel> suggestions = [];
    for (var i = 0; i < songsList.length; i++) {
      if (songsList[i].name.toUpperCase().contains(keyword.toUpperCase())) {
        suggestions.add(songsList[i]);
      }
    }
    return suggestions;
  }

}