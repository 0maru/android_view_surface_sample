#import "AndroidViewSurfaceSamplePlugin.h"
#if __has_include(<android_view_surface_sample/android_view_surface_sample-Swift.h>)
#import <android_view_surface_sample/android_view_surface_sample-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "android_view_surface_sample-Swift.h"
#endif

@implementation AndroidViewSurfaceSamplePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAndroidViewSurfaceSamplePlugin registerWithRegistrar:registrar];
}
@end
