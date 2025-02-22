//
//  OIMManager+Friend.m
//  OpenIMSDK
//
//  Created by x on 2022/2/16.
//

#import "OIMManager+Friend.h"
#import "CallbackProxy.h"

@implementation OIMManager (Friend)

- (void)addFriend:(NSString *)uid
       reqMessage:(NSString *)reqMessage
        onSuccess:(OIMSuccessCallback)onSuccess
        onFailure:(OIMFailureCallback)onFailure {
    
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    NSDictionary *param = @{@"toUserID": uid, @"reqMsg": reqMessage ?: @""};
    Open_im_sdkAddFriend(callback, [self operationId], param.mj_JSONString);
}

- (void)getFriendApplicationListWithOnSuccess:(OIMFriendApplicationsCallback)onSuccess
                                    onFailure:(OIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([OIMFriendApplication mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Open_im_sdkGetRecvFriendApplicationList(callback, [self operationId]);
}

- (void)getSendFriendApplicationListWithOnSuccess:(OIMFriendApplicationsCallback)onSuccess
                                        onFailure:(OIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([OIMFriendApplication mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Open_im_sdkGetSendFriendApplicationList(callback, [self operationId]);
}

- (void)acceptFriendApplication:(NSString *)uid
                      handleMsg:(NSString *)msg
                      onSuccess:(OIMSuccessCallback)onSuccess
                      onFailure:(OIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    NSDictionary *param = @{@"toUserID": uid, @"handleMsg": msg ?: @""};
    Open_im_sdkAcceptFriendApplication(callback, [self operationId], param.mj_JSONString);
}

- (void)refuseFriendApplication:(NSString *)uid
                      handleMsg:(NSString *)msg
                      onSuccess:(OIMSuccessCallback)onSuccess
                      onFailure:(OIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    NSDictionary *param = @{@"toUserID": uid, @"handleMsg": msg ?: @""};
    Open_im_sdkRefuseFriendApplication(callback, [self operationId], param.mj_JSONString);
}

- (void)addToBlackList:(NSString *)uid
             onSuccess:(OIMSuccessCallback)onSuccess
             onFailure:(OIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Open_im_sdkAddBlack(callback, [self operationId], uid);
}

- (void)getBlackListWithOnSuccess:(OIMBlacksInfoCallback)onSuccess
                        onFailure:(OIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([OIMBlackInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Open_im_sdkGetBlackList(callback, [self operationId]);
}

- (void)removeFromBlackList:(NSString *)uid
                  onSuccess:(OIMSuccessCallback)onSuccess
                  onFailure:(OIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Open_im_sdkRemoveBlack(callback, [self operationId], uid);
}

- (void)getDesignatedFriendsInfo:(NSArray<NSString *> *)uids
                       onSuccess:(OIMFullUsersInfoCallback)onSuccess
                       onFailure:(OIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([OIMFullUserInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Open_im_sdkGetDesignatedFriendsInfo(callback, [self operationId], uids.mj_JSONString);
}

- (void)getFriendListWithOnSuccess:(OIMFullUsersInfoCallback)onSuccess
                         onFailure:(OIMFailureCallback)onFailure {
    
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([OIMFullUserInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Open_im_sdkGetFriendList(callback, [self operationId]);
}

- (void)checkFriend:(NSArray<NSString *> *)uids
          onSuccess:(OIMSimpleResultsCallback)onSuccess
          onFailure:(OIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([OIMSimpleResultInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Open_im_sdkCheckFriend(callback, [self operationId], uids.mj_JSONString);
}

- (void)setFriendRemark:(NSString *)uid
                 remark:(NSString *)remark
              onSuccess:(OIMSuccessCallback)onSuccess
              onFailure:(OIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    NSDictionary *param = @{@"toUserID": uid, @"remark": remark ?: @""};
    Open_im_sdkSetFriendRemark(callback, [self operationId], param.mj_JSONString);
}

- (void)deleteFriend:(NSString *)friendUserID
           onSuccess:(OIMSuccessCallback)onSuccess onFailure:(OIMFailureCallback)onFailure {
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:onSuccess onFailure:onFailure];
    
    Open_im_sdkDeleteFriend(callback, [self operationId], friendUserID);
}

- (void)searchUsers:(OIMSearchUserParam *)searchParam
          onSuccess:(nullable OIMSearchUsersInfoCallback)onSuccess
          onFailure:(nullable OIMFailureCallback)onFailure {
    
    assert(searchParam.isSearchRemark || searchParam.isSearchNickname || searchParam.isSearchUserID);
    
    CallbackProxy *callback = [[CallbackProxy alloc]initWithOnSuccess:^(NSString * _Nullable data) {
        if (onSuccess) {
            onSuccess([OIMSearchUserInfo mj_objectArrayWithKeyValuesArray:data]);
        }
    } onFailure:onFailure];
    
    Open_im_sdkSearchFriends(callback, [self operationId], searchParam.mj_JSONString);
}


@end
