# flutter_youtube_downloader

A flutter plugin for extracting and downloading youtube video url

## Usage

[Example] (https://github.com/Destiny-Ed/flutter_youtube_downloader/blob/main/example/lib/main.dart)

To use this plugin : *add the dependency to your [pubspec.yaml] file

```yaml
    dependencies:
        flutter:
            sdk : flutter
        flutter_youtube_downloader:
```

Add to your app manifest.xml file

```xml
  <manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools">  <!-- Add This line -->
    
    ...........
  
    <application
        ..............
        <!-- Add This line -->

        tools:replace="android:label" 
        android:requestLegacyExternalStorage="true"> <!-- Add This line if you are targeting android API 29+-->

        <activity>
            ...............
        </activity>
     
    </application>
</manifest>

```

## Warning

Make sure you don't add ...(dots) after the video title name

[Example] Bad
final result = await FlutterYoutubeDownloader.downloadVideo(
            youTube_link, "Video Title goes Here...", 18);

[Example] Good
final result = await FlutterYoutubeDownloader.downloadVideo(
            youTube_link, "Video Title goes Here", 18);

## How To Use

```dart
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
      String _extractedLink = 'Loading...';

      String youTube_link = "https://www.youtube.com/watch?v=nRhYQlg8fVw";

      @override
      void initState() {
        super.initState();
        extractYoutubeLink();
      }

      // Platform messages are asynchronous, so we initialize in an async method.
      Future<void> extractYoutubeLink() async {
        String link;
        // Platform messages may fail, so we use a try/catch PlatformException.
        try {
          link = await FlutterYoutubeDownloader.extractYoutubeLink(youTube_link, 18);
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
            youTube_link, "Video Title goes Here", 18);
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
```

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

