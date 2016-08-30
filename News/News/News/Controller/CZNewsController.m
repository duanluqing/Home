//
//  CZNewsController.m
//  News
//
//  Created by mac on 16/8/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CZNewsController.h"
#import "CZNewsModel.h"
#import "CZNewsCell.h"

@interface CZNewsController ()
///  新闻数据
@property (nonatomic, strong) NSArray *data;
@end

@implementation CZNewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNews];
   
}
-(void)loadNews
{
    [CZNewsModel NewsDatsWithURL:@"article/headline/T1348647853363/0-20.html" success:^(NSArray *news) {
        self.data = news;
        //刷新TableView
        [self.tableView reloadData];
    }];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取出新闻模型
    CZNewsModel *news = self.data[indexPath.row];
  
    CZNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[CZNewsCell cellIdentiferWithNews:news] forIndexPath:indexPath];
    //设置模型数据
    cell.news = news;
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取出新闻模型
    CZNewsModel *news = self.data[indexPath.row];
    return [CZNewsCell cellHeightWithNews:news];

}
@end
