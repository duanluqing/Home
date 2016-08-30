//
//  CZNewsCell.h
//  News
//
//  Created by mac on 16/8/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZNewsModel;
@interface CZNewsCell : UITableViewCell
@property (nonatomic, strong) CZNewsModel *news;
///  返回cell重用ID
///
///  @param news 模型
///
///  @return 重用ID
+(NSString*)cellIdentiferWithNews:(CZNewsModel*)news;
///  返回cell的高度
+(CGFloat)cellHeightWithNews:(CZNewsModel*)news;
@end
