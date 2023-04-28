import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:map_artist/providers/database_provider.dart';
import 'package:map_artist/providers/app_theme_provider.dart';
import 'package:map_artist/pages/preview.dart';

class Record extends HookConsumerWidget {
  const Record({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref.watch(pointsListProvider);
    final pointsNotifier = ref.watch(pointsListProvider.notifier);

    ThemeMode modeNow = ref.watch(appThemeNotifierProvider);
    if (modeNow == ThemeMode.system){
      bool isDarkMode = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
      modeNow = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }
    IconData switchIcon = modeNow == ThemeMode.light ? Icons.dark_mode : Icons.light_mode;
    ThemeMode modeNext = modeNow == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    useEffect(() {
      pointsNotifier.find();
      return;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Data'),
        centerTitle: true,
        elevation: 10,
        actions: [
          IconButton(
            icon: Icon(switchIcon),
            onPressed: () {
              ref.read(appThemeNotifierProvider.notifier).updateState(modeNext);
            },
          ),
        ],
      ),
      body: points.isEmpty ? const Center(child: Text("保存されたデータはありません")):
      ListView.builder(
        itemCount: points.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(points[index].value.title),
              subtitle: Text("${points[index].value.createdAt}"),
              trailing: IconButton(// Todo:ココを押すと保存された線データをGoogleMap上に表示したページに遷移
                icon: const Icon(Icons.map),
                onPressed: () {
                  debugPrint('${points[index].value.points}');
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context){return Preview(record:points[index]);}
                  ));
                },
              ),
            )
          );
        } 
      )
    );
  }
}