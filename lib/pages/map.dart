import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:map_artist/providers/map_provider.dart';

import './components/map_permission.dart';
import './components/map_core.dart';

class Map extends ConsumerWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MapPage'),
        centerTitle: true,
        elevation: 10,
      ),

      body: Theme(
        data: theme,
        child: FutureBuilder<Object>(
        future: determinePermission(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return MapWidget(permission : snapshot.data);
          }
          else if (snapshot.hasError) {
            return const MapWidget();
          }
          else {
            return const Center(
              child: CircularProgressIndicator()
            );
          }
        }
      )
      )
    );
  }
}