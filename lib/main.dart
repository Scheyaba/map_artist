import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:map_artist/pages/home.dart';

void main() {
  runApp(const ProviderScope(child: MapArtist()));
}

class MapArtist extends StatelessWidget {
  const MapArtist({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child){
        return const MaterialApp(
          home: Home(),
        );
      }
    );
  }
}