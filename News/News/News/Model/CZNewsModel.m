//
//  CZNewsModel.m
//  News
//
//  Created by mac on 16/8/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CZNewsModel.h"
#import <YYModel.h>
#import "CZApiManage.h"
#import "CZNewsImageModel.h"

@implementation CZNewsModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"imgextra" : [CZNewsImageModel class],
             };
}
+(void)NewsDatsWithURL:(NSString *)url success:(void (^)(NSArray *))success
{
    //禁言
    NSAssert(success !=nil, @"回调不能为空");
   [[CZApiManage sharedApi]requestNewsDatWithURL:url success:^(NSDictionary* responseObject) {
       //取出第一个Key T1348647853363
       NSString *key = responseObject.keyEnumerator.nextObject;
       NSArray *data = responseObject[key];
       NSArray *tmp = [NSArray yy_modelArrayWithClass:self json:data];
       NSLog(@"%@",tmp);
       success(tmp);
   } error:^(NSError *errorInFo) {
       success(nil);
   }];
}
@end
