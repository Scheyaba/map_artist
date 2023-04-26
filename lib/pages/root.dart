import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:map_artist/pages/home.dart';
import 'package:map_artist/pages/map.dart';

class Root extends HookWidget {
  const Root({super.key});
  @override
  Widget build(BuildContext context) {
    final index = useState(0);

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
      body: pages[index.value],
      bottomNavigationBar: BottomNavigationBar(
        key: const Key("BottomNavigationBar_rootPage"), 
        items: items,
        currentIndex: index.value,
        onTap: (indexTap){
          index.value = indexTap;
        },
      )
    );
  }
}