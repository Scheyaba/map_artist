import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:map_artist/providers/database_provider.dart';

class Record extends HookConsumerWidget {
  const Record({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref.watch(pointsListProvider);
    final pointsNotifier = ref.watch(pointsListProvider.notifier);

    useEffect(() {
      pointsNotifier.find();
      return;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Data'),
        centerTitle: true,
        elevation: 10,
      ),
      body: points.isEmpty ? ListView.builder(
        itemCount: points.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(points[index].value.title),
              trailing: IconButton(// Todo:ココを押すと保存された線データをGoogleMap上に表示したページに遷移
                icon: const Icon(Icons.open_in_new),
                onPressed: () {
                  debugPrint('${points[index].value.points}');
                },
              ),
            )
          );
        } 
      )
      : const Center(child: Text("保存されたデータはありません")),
    );
  }
}