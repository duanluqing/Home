//
//  CZHeadLineController.m
//  News
//
//  Created by mac on 16/8/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CZHeadLineController.h"
#import "CZHeadLineCell.h"
#import "CZApiManage.h"

@interface CZHeadLineController ()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *Layout;

@end

@implementation CZHeadLineController

static NSString * const reuseIdentifier = @"HeadLine";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setView];
    [self loadDate];
    
    
}
/**
 *  加载头条数据
 */
-(void)loadDate
{
   [[CZApiManage sharedApi]requestHeadLineDatWithURL:@"ad/headline/0-4.html" success:^(id responseObject) {
       NSLog(@"%@",responseObject);
   } error:^(NSError *errorInFo) {
       NSLog(@"%@",errorInFo);
   }];

}
//设置布局
-(void)setView{
    //设置背景色
    self.collectionView.backgroundColor = [UIColor whiteColor];
    //设置item大小
    self.Layout.itemSize = self.collectionView.bounds.size;
    //设置滑动方向
    self.Layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置间距
    self.Layout.minimumLineSpacing = NO;
    //隐藏滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //不要弹簧
    self.collectionView.bounces = NO;
    //设置分页
    self.collectionView.pagingEnabled = YES;


}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CZHeadLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor =  [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];

    return cell;

}
@end
