//
//  ClassVC.m
//  SlideMenuTest1122
//
//  Created by 劉坤昶 on 2015/11/23.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "ClassVC.h"
#import "ClassCell.h"

@interface ClassVC () <UITableViewDataSource , UITableViewDelegate>
{
    
    NSArray *photoArray;
    NSArray *classNAameArray;
}

@property (strong , nonatomic) UITableView *tableView;



@end

@implementation ClassVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
    
    // tableView相關設定
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 160, self.view.frame.size.width, self.view.frame.size.height-160)];
    
    [self.tableView registerClass:[ClassCell class] forCellReuseIdentifier:@"ClassCell"];

    [self.view addSubview:self.tableView];
    
    
    
    photoArray = [[NSArray alloc] initWithObjects:
                  [UIImage imageNamed:@"gym"],
                  [UIImage imageNamed:@"basketball"],
                  [UIImage imageNamed:@"swim"],
                  [UIImage imageNamed:@"crossfit"],
                  [UIImage imageNamed:@"boxing"],nil];
    
    classNAameArray = [[NSArray alloc] initWithObjects:@"體育館",@"籃球場",@"游泳課",@"綜合訓練課",@"拳擊有氧", nil];
    

}



#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  photoArray.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClassCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ClassCell" forIndexPath:indexPath];
    
    cell.classImage.image = photoArray[indexPath.row];
    cell.classNameLabel.text = classNAameArray[indexPath.row];
    
    
    
    return  cell;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
