#import "EasytbkPlugin.h"

@implementation EasytbkPlugin

EasytbkLoginService *_loginService;
EasytbkTradeHandler *_tradeHandler;


+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"easytbk"
            binaryMessenger:[registrar messenger]];
  EasytbkPlugin* instance = [[EasytbkPlugin alloc] init];
//   [registrar addMethodCallDelegate:instance channel:channel];
  [registrar addApplicationDelegate:instance];

}

// 初始化
- (instancetype)initWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar {
    self = [super init];

    if (self) {
        _loginService = [[EasytbkLoginService alloc] init];
        _tradeHandler = [[EasytbkTradeHandler alloc] init];
    }

    return self;
}



- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {

     if ([@"initTradeAsync" isEqualToString:call.method]) {
        [_tradeHandler initTradeAsync:call result:result];
    } else if ([@"login" isEqualToString:call.method]) {
        [_loginService handleLogin:call result:result];
    } else if ([@"isLogin" isEqualToString:call.method]) {
        [_loginService handleIsLogin:call result:result];
    } else if ([@"getUser" isEqualToString:call.method]) {
        [_loginService handleGetUser:call result:result];
    } else if ([@"logout" isEqualToString:call.method]) {
        [_loginService handleLogout:result];
    } else if([@"openItemDetail" isEqualToString:call.method]){
        [_tradeHandler openItemDetail:call result:result];
    } else if([@"openUrl" isEqualToString:call.method]){
        [_tradeHandler openUrl:call result:result];
    }else if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else {
        result(FlutterMethodNotImplemented);
    }
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    return [[AlibcTradeSDK sharedInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options {
    return [[AlibcTradeSDK sharedInstance] application:app openURL:url options:options];
}


@end
