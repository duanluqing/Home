//
//  CZApiManage.h
//  News
//
//  Created by mac on 16/8/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZApiManage : NSObject
+(instancetype)sharedApi;
/**
 *  请求头条的广告数据
 *
 *  @param url     请求的路径
 *  @param success 成功回调
 *  @param error   失败回调
 */
-(void)requestHeadLineDatWithURL:(NSString*)url success:(void(^)(id responseObject))success error:(void(^)(NSError *errorInFo))error;
///  请求新闻的数据
///
///  @param url     请求路径
///  @param success 成功回调
///  @param error   失败回调
-(void)requestNewsDatWithURL:(NSString*)url success:(void(^)(id responseObject))success error:(void(^)(NSError *errorInFo))error;
@end
