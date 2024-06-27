import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/screens/album_details.dart';

class AlbumPreview extends StatelessWidget {
  const AlbumPreview({super.key, required this.album});
  final Album album;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Material(
        color: const Color.fromARGB(255, 42, 30, 24),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: _buildListTile(context),
      ),
    );
  }

  ListTile _buildListTile(BuildContext context) {
    return ListTile(
        leading: album.image != null ? Image.asset(album.image!) : const Icon(Icons.motion_photos_off_outlined),
        title: Text(album.title),
        trailing: const Icon(Icons.search, color: Colors.white,),
        textColor: Colors.white,
        tileColor: album.isFavorite ? const Color.fromARGB(255, 88, 60, 45) : const Color.fromARGB(255, 42, 30, 24),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        onTap: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AlbumDetails(album: album)))
        },
      );
  }
}
