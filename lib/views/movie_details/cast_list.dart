import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../data/model/movie_model.dart';

class CastList extends StatelessWidget {
  final Movie movie;

  const CastList({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: movie.cast.map((c) {
        return Card(
          color: Colors.white10,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.white24,
                child: c.urlSmallImage != null
                    ? CachedNetworkImage(
                        imageUrl: c.urlSmallImage!,
                        fit: BoxFit.cover,
                        memCacheWidth: 150, // Keeps memory low
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.person, color: Colors.grey),
                      )
                    : const Icon(Icons.person, color: Colors.grey),
              ),
            ),
            title: Text(
              "Name: ${c.name}",
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            subtitle: Text(
              "Character: ${c.characterName}",
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        );
      }).toList(),
    );
  }
}
