//
//  HomeVC.m
//  SlideMenuTest1122
//
//  Created by 劉坤昶 on 2015/11/22.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "HomeVC.h"
#import "LeftMenuTVC.h"
#import "HomeCell.h"

#import "ClassVC.h"

@interface HomeVC () <UITableViewDelegate , UITableViewDataSource>
{
    NSArray *photoArray ;
}

@property (strong , nonatomic) UITableView *tableView;

@property (strong , nonatomic) UIView *testView;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"課程探索";
    
    //tableView設定
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 95, self.view.frame.size.width, self.view.frame.size.height-90)];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor grayColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[HomeCell class] forCellReuseIdentifier:@"HomeCell"];
    
    
    self.testView = [[UIView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 100)];
    self.testView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.testView];
    
    
    
    photoArray = [[NSArray alloc] initWithObjects:
                  [UIImage imageNamed:@"gym"],
                  [UIImage imageNamed:@"swim"],
                  [UIImage imageNamed:@"yoga"],
                  [UIImage imageNamed:@"basketball"],
                  [UIImage imageNamed:@"crossfit"],nil];
    
    
    
    UIBarButtonItem *leftBarButtonItem =
    [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"left"]
                                     style:UIBarButtonItemStylePlain
                                    target:[SlideNavigationController sharedInstance]
                                    action:@selector(toggleLeftMenu)];
   
    
    [SlideNavigationController sharedInstance].leftBarButtonItem = leftBarButtonItem;
    

  

}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}



#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return photoArray.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.bigPhoto.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 150);
    cell.bigPhoto.image = photoArray[indexPath.row];
    
    
    return  cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClassVC *controller = [[ClassVC alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    
    
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
