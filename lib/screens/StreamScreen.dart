import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StreamScreen extends StatefulWidget {
  final bool isHost;
  final String userId;
  final String liveId;
  final String userName;

  const StreamScreen({
    Key? key,
    required this.isHost,
    required this.userId,
    required this.liveId,
    required this.userName,
  }) : super(key: key);

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  @override
  Widget build(BuildContext context) {
    print(dotenv.env);
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: int.parse(dotenv.env['APP_ID']!),
        appSign: dotenv.env['APP_SIGN']!,
        userID: widget.userId,
        userName: widget.userName,
        liveID: widget.liveId,
        config: widget.isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
        // ..confirmDialogInfo = LiveStreamingConfirmDialogInfo(
        //   title: "Leave confirm",
        //   message: "Do you want to end?",
        //   cancelButtonName: "Cancel",
        //   confirmButtonName: "Confirm",
        // ),
      ),
    );
  }
}
