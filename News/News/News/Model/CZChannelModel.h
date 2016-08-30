//
//  CZChannelModel.h
//  News
//
//  Created by mac on 16/8/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZChannelModel : NSObject
///  频道名字
@property (nonatomic, copy) NSString *tname;
///  频道ID
@property (nonatomic, copy) NSString *tid;
///  返回频道的数据
///
///  @return 频道的数据
+(NSArray*)channelDatas;
@end
