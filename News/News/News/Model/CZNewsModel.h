//
//  CZNewsModel.h
//  News
//
//  Created by mac on 16/8/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CZNewsImageModel;
@interface CZNewsModel : NSObject
///  跟帖
@property (nonatomic, copy) NSString *replyCount;
///  标题
@property (nonatomic, copy) NSString *title;
///  简介
@property (nonatomic, copy) NSString *digest;
///  图片
@property (nonatomic, copy) NSString *imgsrc;
///  更多图片
@property (nonatomic, strong) NSArray<CZNewsImageModel*> *imgextra;
///  图片类型 1为大图 默认是0  
@property (nonatomic, assign) NSInteger imgType;

///  加载新闻数据
///
///  @param url     url
///  @param success 成功回调
+(void)NewsDatsWithURL:(NSString*)url success:(void(^)(NSArray*news))success;

@end
