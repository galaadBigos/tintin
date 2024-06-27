import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/providers/reading_list_provider.dart';
import 'package:tintin/services/album_service.dart';
import 'package:tintin/widgets/album_preview.dart';

class AlbumsMater extends StatefulWidget {
  const AlbumsMater({super.key, required this.title});
  final String title;

  @override
  State<AlbumsMater> createState() => _AlbumsMaterState();
}

class _AlbumsMaterState extends State<AlbumsMater> {
  List<Album> _albums = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Center(child: Text(widget.title, textAlign: TextAlign.center,)),
    );
  }

  FutureBuilder<List<Album>> _buildBody() {
  return FutureBuilder<List<Album>>(
    future: AlbumService.fetchAlbums(),
    builder: (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Erreur: ${snapshot.error}'));
      } else if (snapshot.hasData) {
        _albums = snapshot.data!;
        return _buildAlbumsListView(_albums);
      } else {
        return const Center(child: Text('Aucun album disponible'));
      }
    },
  );
}

  Consumer<ReadingListProvider> _buildAlbumsListView(List<Album> albums) {
    return Consumer<ReadingListProvider>(
      builder: (BuildContext context, ReadingListProvider value, Widget? child) { 
      return ListView.builder(
            itemCount: albums.length,
            itemBuilder: (BuildContext context, int index) {
              Album album = albums[index];
              album.isFavorite = Provider.of<ReadingListProvider>(context, listen: false).contain(album);
              return AlbumPreview(album: album);
            },
          );},
    );
  }
}