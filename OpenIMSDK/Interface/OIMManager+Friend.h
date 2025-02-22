//
//  OIMManager+Friend.h
//  OpenIMSDK
//
//  Created by x on 2022/2/16.
//

#import "OIMManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface OIMManager (Friend)

/*
 * 添加朋友
 *
 * @param uid    对方userID
 * @param reqMessage 请求消息
 */
- (void)addFriend:(NSString *)uid
       reqMessage:(NSString * _Nullable)reqMessage
        onSuccess:(nullable OIMSuccessCallback)onSuccess
        onFailure:(nullable OIMFailureCallback)onFailure;

/*
 * 获取收到的好友申请，既哪些人申请加我为好友
 */
- (void)getFriendApplicationListWithOnSuccess:(nullable OIMFriendApplicationsCallback)onSuccess
                                    onFailure:(nullable OIMFailureCallback)onFailure;

/*
 * 发出的好友申请
 */
- (void)getSendFriendApplicationListWithOnSuccess:(nullable OIMFriendApplicationsCallback)onSuccess
                                        onFailure:(nullable OIMFailureCallback)onFailure;

/*
 * 同意某人的好友申请
 * @param uid 用户id
 */
- (void)acceptFriendApplication:(NSString *)uid
                      handleMsg:(NSString *)msg
              onSuccess:(nullable OIMSuccessCallback)onSuccess
              onFailure:(nullable OIMFailureCallback)onFailure;

/*
 * 拒绝好友申请
 *
 * @param uid  用户ID
 */
- (void)refuseFriendApplication:(NSString *)uid
                      handleMsg:(NSString *)msg
              onSuccess:(nullable OIMSuccessCallback)onSuccess
              onFailure:(nullable OIMFailureCallback)onFailure;

/*
 * 加入黑名单
 *
 * @param uid  用户ID
 */
- (void)addToBlackList:(NSString *)uid
             onSuccess:(nullable OIMSuccessCallback)onSuccess
             onFailure:(nullable OIMFailureCallback)onFailure;

/*
 * 黑名单
 *
 */
- (void)getBlackListWithOnSuccess:(nullable OIMBlacksInfoCallback)onSuccess
                         onFailure:(nullable OIMFailureCallback)onFailure;
/*
 * 移除黑名单
 *
 * @param uid  用户ID
 */
- (void)removeFromBlackList:(NSString *)uid
                  onSuccess:(nullable OIMSuccessCallback)onSuccess
                  onFailure:(nullable OIMFailureCallback)onFailure;

/*
 * 获取指定好友列表的相关信息
 *
 * @param uids 用户id列表
 */
- (void)getDesignatedFriendsInfo:(NSArray <NSString *> *)uids
                       onSuccess:(nullable OIMFullUsersInfoCallback)onSuccess
                       onFailure:(nullable OIMFailureCallback)onFailure;

/*
 * 获取所有好友的相关信息
 */
- (void)getFriendListWithOnSuccess:(nullable OIMFullUsersInfoCallback)onSuccess
                         onFailure:(nullable OIMFailureCallback)onFailure;

/*
 * 检查是否好友关系，即是否在登录用户的好友列表中。注意：好友是双向关系。
 * result为1表示好友（并且不是黑名单）
 *
 * @param uidList userID列表
*/
- (void)checkFriend:(NSArray <NSString *> *)uids
          onSuccess:(nullable OIMSimpleResultsCallback)onSuccess
          onFailure:(nullable OIMFailureCallback)onFailure;

/*
 * 设置好友备注
 *
 * @param uid 用户id
 * @param remark 备注信息
 */
- (void)setFriendRemark:(NSString *)uid
                 remark:(NSString * _Nullable)remark
              onSuccess:(nullable OIMSuccessCallback)onSuccess
              onFailure:(nullable OIMFailureCallback)onFailure;

/*
 * 删除好友，好友是双向关系，此函数仅仅删除自己的好友
 *
 * @param friendUserID  好友ID
 */
- (void)deleteFriend:(NSString *)friendUserID
           onSuccess:(nullable OIMSuccessCallback)onSuccess
           onFailure:(nullable OIMFailureCallback)onFailure;

/*
 *  搜索用户,可能是非好友
 */
- (void)searchUsers:(OIMSearchUserParam *)searchParam
          onSuccess:(nullable OIMSearchUsersInfoCallback)onSuccess
          onFailure:(nullable OIMFailureCallback)onFailure;
@end

NS_ASSUME_NONNULL_END
