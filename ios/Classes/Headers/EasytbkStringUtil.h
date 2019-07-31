#import <Foundation/Foundation.h>

@interface EasytbkStringUtil : NSObject
+ (BOOL) isBlank:(NSString *)string;
+ (NSString *) nilToEmpty:(NSString *) string;
@end