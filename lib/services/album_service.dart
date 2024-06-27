import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:tintin/models/album.dart';

class AlbumService {

  static Future<List<Album>> fetchAlbums() async {
    String jsonString = await rootBundle.loadString('data/albums.json');
    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => Album.fromJson(json)).toList();
  }
}