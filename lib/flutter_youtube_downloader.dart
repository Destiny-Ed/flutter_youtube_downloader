import 'dart:async';

import 'package:flutter/services.dart';

class FlutterYoutubeDownloader {
  static const MethodChannel _channel =
      const MethodChannel('flutter_youtube_downloader');

  static Future<dynamic> downloadVideo(
      String youTubeVideoUrl, String title) async {
    try {
      final String result = await _channel.invokeMethod(
          'downloadVideo', {"url": youTubeVideoUrl, "title": title});
      return result;
    } on PlatformException catch (e) {
      return e.message;
    }
  }

  static Future<dynamic> extractYoutubeLink(String youTubeVideoUrl) async {
    try {
      final String result = await _channel
          .invokeMethod('downloadVideo', {"url": youTubeVideoUrl});
      return result;
    } on PlatformException catch (e) {
      return e.message;
    }
  }
}
