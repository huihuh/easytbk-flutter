#import "EasytbkLoginService.h"
#import "EasytbkConstants.h"

@implementation EasytbkLoginService


- (void)handleGetUser:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSDictionary *user = nil;
    BOOL isLogin = [[ALBBSession sharedInstance] isLogin];
    if (isLogin) {
        
        user = @{
                @"avatarUrl": [[ALBBSession sharedInstance]getUser].avatarUrl,
                @"nick": [[ALBBSession sharedInstance]getUser].nick,
                @"openId": [[ALBBSession sharedInstance]getUser].openId,
                @"openSid": [[ALBBSession sharedInstance]getUser].openSid,
                @"topAccessToken": [[ALBBSession sharedInstance]getUser].topAccessToken,
                @"topAuthCode":[[ALBBSession sharedInstance]getUser].topAuthCode,
                
        };
    }
    result(@{
            easytbkKeyPlatform: easytbkKeyIOS,
            easytbkKeyResult: @(isLogin),
            @"user": user
    });
}

- (void)handleIsLogin:(FlutterMethodCall *)call result:(FlutterResult)result {
    result( @([[ALBBSession sharedInstance] isLogin]));
}

- (void)handleLogin:(FlutterMethodCall *)call result:(FlutterResult)result {
    UIViewController *rootViewController =
            [UIApplication sharedApplication].delegate.window.rootViewController;

    [[ALBBSDK sharedInstance] auth:rootViewController successCallback:^(ALBBSession *session) {
        result(@{
                easytbkKeyPlatform: easytbkKeyIOS,
                easytbkKeyResult: @YES,
                @"user": @{
                        @"avatarUrl": [session getUser].avatarUrl,
                        @"nick": [session getUser].nick,
                        @"openId": [session getUser].openId,
                        @"openSid": [session getUser].openSid,
                        @"topAccessToken": [session getUser].topAccessToken,
                        @"topAuthCode":[session getUser].topAuthCode,
                }
        });
    }              failureCallback:^(ALBBSession *session, NSError *error) {
        result(@{
                easytbkKeyPlatform: easytbkKeyIOS,
                easytbkKeyResult: @NO,
                easytbkKeyErrorCode: @(error.code),
                easytbkKeyErrorMessage: error.description
        });
    }];

}


- (void)handleLogout:(FlutterResult)result {
    [[ALBBSDK sharedInstance] logout];
    result(@{
        easytbkKeyPlatform:easytbkKeyIOS,
        easytbkKeyResult:@YES
    });
}

- (NSString *)jsonClassConvertToJsonStringWithJsonClass:(id)jsonClass {
    NSString *resultString;

    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonClass options:NSJSONWritingPrettyPrinted error:&error];
    if (error == nil) {
        resultString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }

    return resultString;
}

@end
