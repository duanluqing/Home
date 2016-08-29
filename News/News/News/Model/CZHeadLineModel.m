//
//  CZHeadLineModel.m
//  News
//
//  Created by mac on 16/8/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CZHeadLineModel.h"
#import "CZApiManage.h"

@implementation CZHeadLineModel
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)HeadLineWithDict:(NSDictionary *)dict
{
 
    return [[self alloc]initWithDict:dict];
}

///  调用这个方法是防止setValuesForKeysWithDictionary崩了
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}

+(void)headLineDatsWithURL:(NSString *)url success:(void (^)(NSArray *))success
{
    NSAssert(success !=nil, @"回调不能为空");
    [[CZApiManage sharedApi]requestHeadLineDatWithURL:url success:^(NSDictionary* responseObject) {
//        NSLog(@"%@",responseObject.keyEnumerator.nextObject);
        //取出字典中第一个Key
        NSString*key = responseObject.keyEnumerator.nextObject;
        //取出数据数组
        NSArray *date = responseObject[key];
        NSMutableArray *dataM = [NSMutableArray array];
        [date enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           [dataM addObject: [CZHeadLineModel HeadLineWithDict:obj]];
        }];
        success(dataM.copy);
        
    } error:^(NSError *errorInFo) {
//        NSLog(@"%@",errorInFo);
        success(nil);
    }];
}
@end
