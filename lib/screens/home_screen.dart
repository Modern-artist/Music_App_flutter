// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/player/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.black])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const _CustomAppBar(),
          bottomNavigationBar: const _CustomNavBar(),
          body: FutureBuilder<List<SongModel>>(
              future: controller.audioQuery.querySongs(
                  ignoreCase: true,
                  orderType: OrderType.ASC_OR_SMALLER,
                  sortType: null,
                  uriType: UriType.EXTERNAL),
              builder: (BuildContext context, snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data!.isEmpty) {
                  // print(snapshot.data);
                  return const Center(
                      child: Text(
                    "No data.. LOL-_-",
                    style: TextStyle(fontSize: 24, color: Colors.amber),
                  ));
                } else {
                  // print("starts here");
                  // print(snapshot.data![1].displayNameWOExt);
                  // print("ends here");
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        print("starts here");
                        print("index = $index");
                        print(snapshot.data![index].artist);
                        print("ends here");
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            title: Text(
                              snapshot.data![index].displayNameWOExt,
                              // "$snapshot.data![index].displayNameWOExt",
                              // songs[index].title,
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              "${snapshot.data![index].artist}",
                              // "artist $index",
                              style: TextStyle(color: Colors.white),
                            ),
                            leading: Icon(
                              Icons.music_note,
                              color: Colors.amber,
                            ),
                            trailing: Icon(
                              Icons.play_arrow,
                              color: Colors.amber,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
        ));
  }
}

class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Hello There!",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(
              255,
              232,
              232,
              232,
            ),
          ),
        ),
        const SizedBox(height: 8),

        const Text(
          'Enjoy your fav "Sangeet"',
          style: TextStyle(
              color: Color.fromARGB(255, 232, 232, 232),
              fontSize: 28,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 20),
        // TextFormField()
        TextFormField(
          decoration: const InputDecoration(

              // isDense: true,
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Color.fromARGB(62, 255, 255, 255),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              )),
          // pre
        )
      ]),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outlined), label: 'HOME'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border), label: 'Favorite'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined), label: 'HOME'),
      ],
    );
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Sangeet"),
      backgroundColor: Colors.transparent,
      // titleTextStyle: const TextStyle(
      //     color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24),
      elevation: 0,
      leading: const Icon(
        Icons.grid_view_rounded,

        // color: Colors.black,
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://wallpapers.com/images/featured/jtmjd4ifiqi7a48s.jpg"),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
