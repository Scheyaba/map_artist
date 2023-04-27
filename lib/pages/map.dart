import 'package:flutter/material.dart';

import './components/map_position.dart';
import './components/map_widget.dart';

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('MapPage'),
            centerTitle: true,
            elevation: 10,
          ),

          body: FutureBuilder<Object>(
            future: determinePosition(),
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
          ),
        ),
    );
  }
}

