// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';

// void main() {
//   const MethodChannel channel = MethodChannel('flutter_youtube_downloader');

//   TestWidgetsFlutterBinding.ensureInitialized();

//   setUp(() {
//     channel.setMockMethodCallHandler((MethodCall methodCall) async {
//       return '42';
//     });
//   });

//   tearDown(() {
//     channel.setMockMethodCallHandler(null);
//   });

//   test('getPlatformVersion', () async {
//     expect(await FlutterYoutubeDownloader.platformVersion, '42');
//   });
// }
