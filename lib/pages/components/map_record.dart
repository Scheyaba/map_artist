import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:map_artist/providers/map_provider.dart';

class RecordButton extends ConsumerWidget {
  const RecordButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed:(){

            ref.read(themeNotifierProvider.notifier).recordingState();
          },
          child: Text('Start', style: const TextStyle(fontSize: 18),),
        ),
        ElevatedButton(
          onPressed:(){

            ref.read(themeNotifierProvider.notifier).resetState();
          },
          child: Text('Stop', style: const TextStyle(fontSize: 18),),
        ),
      ],
    );
  }
}