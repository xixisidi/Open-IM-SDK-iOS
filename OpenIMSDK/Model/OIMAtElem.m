//
//  OIMAtElem.h
//  OpenIMSDK
//
//  Created by x on 2022/2/11.
//

#import "OIMAtElem.h"
#import <MJExtension/MJExtension.h>

@import OpenIMCore;

@implementation OIMAtInfo

@end

@implementation OIMAtElem

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"atUsersInfo" : [OIMAtInfo class]};
}

- (BOOL)isAtAll {
    return self.atUserList.firstObject != nil &&
    [self.atUserList.firstObject isKindOfClass:[NSString class]] &&
    [self.atUserList.firstObject isEqualToString:Open_im_sdkGetAtAllTag()];
}

@end
