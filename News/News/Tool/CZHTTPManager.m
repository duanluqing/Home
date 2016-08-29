//
//  CZHTTPManager.m
//  News
//
//  Created by mac on 16/8/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CZHTTPManager.h"
#define CZBaseURL [NSURL URLWithString:@"http://c.m.163.com/nc/"]

@implementation CZHTTPManager
+(instancetype)sharedManage
{
    static dispatch_once_t onceToken;
    static CZHTTPManager * instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]initWithBaseURL:CZBaseURL sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    });
    return instance;
}
@end
