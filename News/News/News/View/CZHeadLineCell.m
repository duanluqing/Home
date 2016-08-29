//
//  CZHeadLineCell.m
//  News
//
//  Created by mac on 16/8/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CZHeadLineCell.h"
#import "CZHeadLineModel.h"
#import <UIImageView+WebCache.h>

@interface CZHeadLineCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CZHeadLineCell
-(void)setHeadLine:(CZHeadLineModel *)headLine
{
    _headLine=headLine;
    //设置图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:headLine.imgsrc]];

}
@end
