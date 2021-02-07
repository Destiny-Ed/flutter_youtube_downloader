import 'dart:async';

import 'package:flutter/services.dart';

class FlutterYoutubeDownloader {
  static const MethodChannel _channel =
      const MethodChannel('flutter_youtube_downloader');

  //Itags to use
  // var iTags = listOf(22, 137, 18);

  static Future<dynamic> downloadVideo(
      String youTubeVideoUrl, String title, int videoItag) async {
    try {
      final result = await _channel.invokeMethod('downloadVideo', {
        "url": youTubeVideoUrl,
        "title": title,
        "itag": videoItag == null ? 18 : videoItag
      });
      return result;
    } on PlatformException catch (e) {
      return e.message;
    }
  }

  static Future<dynamic> extractYoutubeLink(
      String youTubeVideoUrl, int videoItag) async {
    try {
      final String result = await _channel.invokeMethod('extractYoutubeLink',
          {"url": youTubeVideoUrl, "itag": videoItag == null ? 18 : videoItag});
      return result;
    } on PlatformException catch (e) {
      return e.message;
    }
  }
}
