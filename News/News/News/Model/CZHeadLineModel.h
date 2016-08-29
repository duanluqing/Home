//
//  CZHeadLineModel.h
//  News
//
//  Created by mac on 16/8/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZHeadLineModel : NSObject
///  图片路劲
@property (nonatomic, copy) NSString *imgsrc;
///  标题
@property (nonatomic, copy) NSString *title;
-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)HeadLineWithDict:(NSDictionary*)dict;
///  加载头条的数据
///
///  @param url     URL
///  @param success 成功回调
+(void)headLineDatsWithURL:(NSString*)url success:(void(^)(NSArray*headLines))success;
@end
