#import "BccmPlayerPlugin.h"
#if __has_include(<bccm_player/bccm_player-Swift.h>)
#import <bccm_player/bccm_player-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "bccm_player-Swift.h"
#endif

@implementation BccmPlayerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBccmPlayerPlugin registerWithRegistrar:registrar];
}
@end
