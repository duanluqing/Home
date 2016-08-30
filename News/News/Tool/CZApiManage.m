//
//  CZApiManage.m
//  News
//
//  Created by mac on 16/8/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CZApiManage.h"
#import "CZHTTPManager.h"

@implementation CZApiManage
+(instancetype)sharedApi
{
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

-(void)requestHeadLineDatWithURL:(NSString *)url success:(void (^)(id))success error:(void (^)(NSError *))error
{
    [[CZHTTPManager sharedManage]GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull errorInFo) {
        if (error) {
            error(errorInFo);
        }
    }];
}

-(void)requestNewsDatWithURL:(NSString *)url success:(void (^)(id))success error:(void (^)(NSError *))error
{
  [[CZHTTPManager sharedManage]GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      if (success) {
          success(responseObject);
      }
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull errorInfo) {
      if (error) {
          error(errorInfo);
      }
      
  }];
}
@end
