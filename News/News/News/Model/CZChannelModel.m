//
//  CZChannelModel.m
//  News
//
//  Created by mac on 16/8/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CZChannelModel.h"
#import <YYModel.h>

@implementation CZChannelModel
+(NSArray *)channelDatas
{
  //文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    
    //取出数据
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    //解析json
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    //取出第一个key
    NSString *key = result.keyEnumerator.nextObject;
    //取出json中的数组数据
    NSArray *array = result[key];
    
    //转成模型
    //返回数组
    return [NSArray yy_modelArrayWithClass:self json:array];

}
@end
