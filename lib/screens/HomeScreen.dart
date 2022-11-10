import 'package:flutter/material.dart';
import 'package:livestream/utils/RouteManager.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, media.size.height * 0.1),
          child: Container(
            height: media.size.height * 0.1,
            decoration: const BoxDecoration(
              color: Colors.redAccent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "Drone Streaming",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "Join stream",
                    style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.remove_red_eye,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
              onPressed: () {
                String userId = uuid.v1();
                StreamArgs args = StreamArgs(
                  isHost: false,
                  userId: userId,
                  liveId: "liveId",
                );
                Navigator.pushNamed(context, RouteManager.stream,
                    arguments: args);
              },
            ),
            TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "Broadcast",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.live_tv_outlined,
                    color: Colors.redAccent,
                  ),
                ],
              ),
              onPressed: () {
                String userId = uuid.v1();
                StreamArgs args = StreamArgs(
                  isHost: true,
                  userId: userId,
                  liveId: "liveId",
                );
                Navigator.pushNamed(context, RouteManager.stream,
                    arguments: args);
              },
            ),
          ],
        ),
      ),
    );
  }
}
