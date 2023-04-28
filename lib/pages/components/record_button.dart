import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_artist/providers/map_provider.dart';

import 'package:map_artist/pages/save.dart';

class RecordButton extends HookConsumerWidget {
  const RecordButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamController = useStreamController<LatLng>();
    final stream = Geolocator.getPositionStream();

    final recording = useState(false);
    final subscription = useState<dynamic>(null);

    void startSubscription() {
      if (!recording.value){
      recording.value = true;
      debugPrint('Received event: listen');
      subscription.value = stream.listen((Position position) {
        LatLng location = LatLng(position.latitude, position.longitude);
        streamController.add(location);
        ref.read(pointsNotifierProvider.notifier).addPointState(location);
        debugPrint("$location");
      });}
    }

    void stopSubscription() async {
      if (recording.value){
        recording.value = false;
        subscription.value.cancel();
        debugPrint('Received event: cancel');
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: !recording.value ? (){
            ref.read(themeNotifierProvider.notifier).recordingState();
            startSubscription();
          } : null,
          child: const Text('Start', style: TextStyle(fontSize: 18),),
        ),
        ElevatedButton(
          onPressed: recording.value ? (){
            ref.read(themeNotifierProvider.notifier).resetState();
            stopSubscription();
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context){
                return const SaveUI();
              })
            );
          } : null,
          child: const Text('Stop', style: TextStyle(fontSize: 18),),
        ),
      ],
    );
  }
}