#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <AlibabaAuthSDK/ALBBSDK.h>

@interface EasytbkLoginService : NSObject
- (void) handleLogin:(FlutterMethodCall *)call result:(FlutterResult)result;
- (void) handleIsLogin:(FlutterMethodCall *)call result:(FlutterResult)result;
- (void) handleGetUser:(FlutterMethodCall *)call result:(FlutterResult)result;
- (void) handleLogout:(FlutterResult)result;
@end
