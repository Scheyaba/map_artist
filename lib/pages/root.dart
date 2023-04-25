import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:map_artist/pages/home.dart';
import 'package:map_artist/pages/map.dart';

import 'package:map_artist/providers/page_index.dart';

class Root extends ConsumerWidget {
  const Root({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexProvider);

    const items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label:"ホーム"
        ),
      BottomNavigationBarItem(
        icon: Icon(Icons.map),
        label:"Map"
        ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label:"ホーム"
        ),
    ];

    final pages = [
      const Home(),
      const Map(),
      const Home(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        key: const Key("BottomNavigationBar_rootPage"), // テストコード用
        items: items,
        currentIndex: index,
        onTap: (indexTap){
          ref.read(indexProvider.notifier).state = indexTap;
        },
      )
    );
  }
}