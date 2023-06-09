import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:map_artist/data/database.dart';
import 'package:map_artist/providers/database_provider.dart';
import 'package:map_artist/providers/app_theme_provider.dart';

import 'package:map_artist/pages/root.dart';
import 'package:map_artist/pages/map.dart';

import 'package:map_artist/theme/theme.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final dbHelper = DbHelper();
  await dbHelper.initialize();  
  
  runApp(ProviderScope(
    overrides: [
      databaseProvider.overrideWithValue(dbHelper),
    ],
    child: const MapArtist()
  ));
}

class MapArtist extends StatelessWidget {
  const MapArtist({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child){
        final defaultMode = ref.watch(appThemeNotifierProvider);
        return MaterialApp(
          initialRoute: "/",
          routes: {
            "/": (context) => const Root(),
            "/map": (context) => const Map(),
          },
          theme: lightThemeData,
          darkTheme: darkThemeData,
          themeMode: defaultMode,
        );
      }
    );
  }
}