import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _extractedLink = 'Loading...';

  String? youTube_link = "https://www.youtube.com/watch?v=nRhYQlg8fVw";

  @override
  void initState() {
    super.initState();
    extractYoutubeLink();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> extractYoutubeLink() async {
    String? link;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      link =
          await (FlutterYoutubeDownloader.extractYoutubeLink(youTube_link!, 18)
              as FutureOr<String?>);
    } on PlatformException {
      link = 'Failed to Extract YouTube Video Link.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _extractedLink = link;
    });
  }

  Future<void> downloadVideo() async {
    final result = await FlutterYoutubeDownloader.downloadVideo(
        youTube_link!, "Video Title goes Here", 18);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Youtube Link Downloader example app'),
        ),
        body: Center(
          child: Text('Extracted Link : $_extractedLink\n'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: downloadVideo,
          child: const Icon(Icons.download_rounded),
        ),
      ),
    );
  }
}
