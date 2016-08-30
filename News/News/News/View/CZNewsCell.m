//
//  CZNewsCell.m
//  News
//
//  Created by mac on 16/8/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CZNewsCell.h"
#import "CZNewsModel.h"
#import <UIImageView+WebCache.h>
#import "CZNewsImageModel.h"
@interface CZNewsCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyCountLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgextra;//多个图片视图

@end
@implementation CZNewsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setNews:(CZNewsModel *)news
{
    _news  = news;
    //设置图片
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:_news.imgsrc]placeholderImage:nil options:SDWebImageRetryFailed|SDWebImageLowPriority];
    //设置标题
    self.titleLabel.text = _news.title;
    //设置简介
    self.digestLabel.text = _news.digest;
    //设置跟帖数
    self.replyCountLabel.text = [NSString stringWithFormat:@"%@人跟帖",_news.replyCount];
    //设置更多图片
    if (_news.imgextra!=nil) {
        [self.imgextra enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //取出对应图片
            CZNewsImageModel *model = _news.imgextra[idx];
            //设置图片
            [obj sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]placeholderImage:nil options:SDWebImageRetryFailed|SDWebImageLowPriority];
        }];
    }
}
+(NSString *)cellIdentiferWithNews:(CZNewsModel *)news
{
    //判断图片个数来决定使用哪个cell
    if (news.imgextra!=nil) {
        
        return @"CZNewsImageMoreCell";
    }else if (news.imgType==1)
    {
       return @"CZNewsBigimageCell";
    }
    else{
        return @"CZNewsCell";
    }

}
+(CGFloat)cellHeightWithNews:(CZNewsModel *)news
{
    //判断图片个数来决定使用哪个cell
    if (news.imgextra!=nil) {
        
        return 110;
    }else if (news.imgType==1)
    {
        return 110;
    }
    else{
        return 80;
    }


}
@end
