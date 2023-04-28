import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:map_artist/providers/map_provider.dart';

class SaveUI extends HookConsumerWidget {
  const SaveUI({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController(text: "");
    final focusNode = useFocusNode();

    final points = ref.watch(pointsNotifierProvider);
    final List pointsList = points.map((e) => e.toJson()).toList();

    final int numRows = pointsList.length;
    final int numCols = pointsList[0].length;

    List<double> colSums = List.filled(numCols, 0);
    for (int i = 0; i < numCols; i++) {
      for (int j = 0; j < numRows; j++) {
        colSums[i] += pointsList[j][i];
      }
      colSums[i] /= numRows;
    }

    LatLng _center = LatLng.fromJson(colSums) ?? LatLng(35.6816, 139.7655);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Save'),
        centerTitle: true,
        elevation: 10,
        actions: const [Icon(Icons.save),],
      ),

      body: GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },

      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                maxLines: 1,
                maxLength: 64,
                focusNode: focusNode,
                controller: textEditingController,     
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Title",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      textEditingController.clear();
                    },
                  )
                ),
                onChanged: (text){
                  //ref.read(searchFieldNotifierProvider.notifier).updateState(copyInputField);
                },
              ),
            ),
            
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black,
                    width: 2
                ),
              ),
              child: SizedBox(
                width: 350,  // or use fixed size like 200
                height: 350,
                child: GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: _center, zoom: 14.0,
                ),
                polylines:{Polyline(
                  polylineId: PolylineId('polyline'),
                  color: Colors.orange,
                  width: 3,
                  points: points,
                )},
              ),
                        ),
            ),
            
            ElevatedButton(
                onPressed: (){
                },
                child: const Text("Save"),
              ),

          ],
        ),
      ),


      ),
      resizeToAvoidBottomInset: false
    );
  }
}