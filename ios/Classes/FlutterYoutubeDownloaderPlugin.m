#import "FlutterYoutubeDownloaderPlugin.h"
#if __has_include(<flutter_youtube_downloader/flutter_youtube_downloader-Swift.h>)
#import <flutter_youtube_downloader/flutter_youtube_downloader-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_youtube_downloader-Swift.h"
#endif

@implementation FlutterYoutubeDownloaderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterYoutubeDownloaderPlugin registerWithRegistrar:registrar];
}
@end
