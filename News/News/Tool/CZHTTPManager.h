//
//  CZHTTPManager.h
//  News
//
//  Created by mac on 16/8/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface CZHTTPManager : AFHTTPSessionManager
+(instancetype)sharedManage;
@end
