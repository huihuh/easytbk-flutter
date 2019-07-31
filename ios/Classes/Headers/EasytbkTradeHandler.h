#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

@interface EasytbkTradeHandler : NSObject
- (void)initTradeAsync:(FlutterMethodCall *)call result:(FlutterResult)result;
- (void)openItemDetail:(FlutterMethodCall *)call result:(FlutterResult)result;
- (void)openUrl:(FlutterMethodCall *)call result:(FlutterResult)result;
@end