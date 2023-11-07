#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import <qr_code_scanner/qr_code_scanner-Swift.h> // Импорт Swift-модуля

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Добавьте следующий вызов
  [SwiftQrCodeScannerPlugin registerWithRegistrar:[self registrarForPlugin:@"net.touchcapture.qr.flutterqr"]];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
@end
