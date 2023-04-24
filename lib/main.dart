import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/home_screen.dart';
import 'screens/playlist_screen.dart';
import 'screens/songs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sangit',
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: const Color.fromARGB(255, 40, 40, 40),
              displayColor: const Color.fromARGB(255, 40, 40, 40))),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: "/", page: () => const HomeScreen()),
        GetPage(name: "/song", page: () => const SongsScreen()),
        GetPage(name: "/playlist", page: () => const PlaylistScreen())
      ],
    );
  }
}
