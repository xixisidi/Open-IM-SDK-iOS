//
//  OIMMessageInfo.m
//  OpenIMSDK
//
//  Created by x on 2022/2/11.
//

#import "OIMMessageInfo.h"

@implementation OIMOfflinePushInfo

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.title = @"";
        self.desc = @"";
        self.ex = @"";
        self.iOSPushSound = @"";
        self.iOSBadgeCount = YES;
    }
    
    return self;
}

@end

@implementation OIMMessageInfo

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.offlinePushInfo = [OIMOfflinePushInfo new];
        self.status = OIMMessageStatusUndefine;
    }
    
    return self;
}

- (NSTimeInterval)hasReadTime {
    if (_hasReadTime == 0) {
        _hasReadTime = _attachedInfoElem.hasReadTime;
    }
    
    return _hasReadTime;
}

@end

@implementation OIMReceiptInfo

@end

