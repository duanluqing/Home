//
//  CZHeadLineController.m
//  News
//
//  Created by mac on 16/8/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CZHeadLineController.h"
#import "CZHeadLineCell.h"
#import "CZHeadLineModel.h"
#define ZuGrout 10000
@interface CZHeadLineController ()

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *Layout;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *date;//collectionView数据
@end

@implementation CZHeadLineController

static NSString * const reuseIdentifier = @"HeadLine";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDate];
    
    
}
-(void)loadDate
{
    [CZHeadLineModel headLineDatsWithURL:@"ad/headline/0-4.html" success:^(NSArray *headLines) {
//        //可变数组
//        NSMutableArray *tmpData = [NSMutableArray arrayWithArray:headLines];
////在前面添加最后一个元素
//        [tmpData insertObject:[headLines lastObject] atIndex:0];
//        //在后面添加第一个元素
//        [tmpData addObject:[headLines firstObject]];
//        
//        self.date = tmpData.copy;
        self.date = headLines;
        //刷新界面
        [self.collectionView reloadData];
        self.pageControl.numberOfPages = self.date.count;
        
        //默认显示第2个元素
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:5000] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }];
   
    }
/**
 *  加载头条数据
 */
//-(void)loadDate
//{
//   [[CZApiManage sharedApi]requestHeadLineDatWithURL:@"ad/headline/0-4.html" success:^(NSDictionary* responseObject) {
//       NSLog(@"%@",responseObject.keyEnumerator.nextObject);
//       //取出字典中第一个Key
//       NSString*key = responseObject.keyEnumerator.nextObject;
//       //取出数据数组
//       NSArray *date = responseObject[key];
//       
//       [date enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//           [CZHeadLineModel HeadLineWithDict:obj];
//       }];
//       
//   } error:^(NSError *errorInFo) {
//       NSLog(@"%@",errorInFo);
//   }];
//
//}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
   [self setView];
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
//使用多个组实现无线循环
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return ZuGrout;

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.date.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CZHeadLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //设置随机背景色
//    cell.backgroundColor =  [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    
    //设置数据
    cell.headLine = self.date[indexPath.item];
    //设置第一页标题
    [self scrollViewDidEndDecelerating:self.collectionView];

    return cell;
}
///  滚动结束的时候要判断是第几张
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    NSLog(@"滚动结束");
    NSInteger index = (NSInteger)(scrollView.contentOffset.x / scrollView.bounds.size.width)%self.date.count;
    CZHeadLineModel *headLine = self.date[index];
    //设置标题
    self.titleLabel.text = headLine.title;
    //设置当前是第几页
    self.pageControl.currentPage = index;
    //设置第几页
//    if (index == self.date.count-1) {
////        NSLog(@"显示第一张");
//        //滚动回第一张
//        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
//    }else if (index==0)
//    {
//        //如果显示最后一张的话 就跳到中间去
//        NSInteger pag =self.date.count-2;
//      [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:pag inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
//    
//    }
}
@end
