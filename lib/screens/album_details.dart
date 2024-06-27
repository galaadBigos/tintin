import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/providers/reading_list_provider.dart';

class AlbumDetails extends StatelessWidget {
  const AlbumDetails({super.key, required this.album});
  final Album album;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _buildAlbumDetails(),
      ),
      floatingActionButton: _buildActionButton(),
    );
  }

  Column _buildAlbumDetails() {
    return Column(
        children: [
          Center(child: Text('Album nº : ${album.title}')),
          Text('Résumé : ${album.resume}'),
          Center(child: Text('Année de parution : ${album.year}')),
          Center(
            child: 
              album.image != null ?
              LayoutBuilder(builder: (context, constraints) => Image.asset(album.image!, width: constraints.maxWidth * 0.4, fit: BoxFit.contain,)) : 
              const Icon(Icons.motion_photos_off_outlined, color: Colors.white,))
        ],
      );
  }

  Consumer<ReadingListProvider> _buildActionButton() {
    return Consumer<ReadingListProvider>(
      builder: (BuildContext context, ReadingListProvider value, Widget? child) {
      return FloatingActionButton(
        onPressed: () { 
          if (album.isFavorite){
            Provider.of<ReadingListProvider>(context, listen: false).remove(album);
          } else {
            Provider.of<ReadingListProvider>(context, listen: false).add(album);
          }
        },
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: Text(album.isFavorite ? 'Retirer de la liste' :'Ajouter à la liste'),
      );
    },
    );
  }

    AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(album.title, textAlign: TextAlign.center,),
    
    );
  }
}