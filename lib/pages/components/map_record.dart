import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class RecordButton extends StatelessWidget {
  const RecordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed:(){},
          child: Text('Start', style: const TextStyle(fontSize: 18),),
        ),
        ElevatedButton(
          onPressed:(){},
          child: Text('Stop', style: const TextStyle(fontSize: 18),),
        ),
      ],
    );
  }
}