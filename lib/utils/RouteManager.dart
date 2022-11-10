import 'package:flutter/material.dart';
import 'package:livestream/screens/HomeScreen.dart';
import 'package:livestream/screens/StreamScreen.dart';

class RouteManager {
  // Routes
  static const String home = '/';
  static const String stream = '/stream';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Route Switching
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (ctx) => const HomeScreen(),
        );

      case stream:
        final args = settings.arguments as StreamArgs;
        return MaterialPageRoute(
          builder: (ctx) => StreamScreen(
            isHost: args.isHost,
            liveId: args.liveId,
            userId: args.userId,
            userName: args.userName,
          ),
        );

      default:
        throw const FormatException("Invalid Route");
    }
  }
}

class StreamArgs {
  final bool isHost;
  final String userId;
  final String liveId;
  final String userName;

  const StreamArgs({
    required this.isHost,
    required this.userId,
    required this.liveId,
    this.userName = "Drone",
  });
}
