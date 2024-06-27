import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';

class ReadingListProvider extends ChangeNotifier {
  final List<Album> _albums = [];

  List<Album> get albums => _albums;

  void add(Album album) {
    _albums.add(album);
    notifyListeners();
  }

  bool contain(Album album){
    return _albums.contains(album);
  }

  void remove(Album album) {
    _albums.remove(album);
    notifyListeners();
  }

  void removeAll() {
    _albums.clear();
    notifyListeners();
  }
}