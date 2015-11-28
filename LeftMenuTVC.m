//
//  LeftMenuTVC.m
//  SlideMenuTest1122
//
//  Created by 劉坤昶 on 2015/11/22.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "LeftMenuTVC.h"
#import "LeftMenuCell.h"

#import "HomeVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"



#import "SlideNavigationContorllerAnimator.h"
#import "SlideNavigationContorllerAnimatorScale.h"
@interface LeftMenuTVC () <UIScrollViewDelegate>
{
    
    NSArray *menuArray;
    
}

@property (nonatomic, assign) BOOL slideOutAnimationEnabled;



@property (strong , nonatomic) UIImageView *backgroundImage;
@property (strong , nonatomic)  UIView *effectView;
@property (strong , nonatomic) UIView *leftProfileView;
@property (strong , nonatomic) UIImageView *userPhoto;
@property (strong , nonatomic)  UIView *headerView;



@end

@implementation LeftMenuTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[LeftMenuCell class] forCellReuseIdentifier:@"LeftMenuCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    menuArray = [[NSArray alloc] initWithObjects:@"我的課程",@"探索課程",@"其他設定",@"最新消息", nil];

    
    ///這個TVC的背景view
    self.backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.backgroundImage.image = [UIImage imageNamed:@"001"];
    self.backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    self.backgroundImage.clipsToBounds = YES;
    self.tableView.backgroundView = self.backgroundImage;
    
   
    self.effectView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+50)];
    self.effectView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    [self.backgroundImage addSubview:self.effectView];
    
    
    ///加個view 放user照片的
    self.leftProfileView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 100)];
    self.leftProfileView.backgroundColor = [UIColor blackColor];
   
    self.leftProfileView.layer.shadowOffset = CGSizeMake(-15, 20);
    self.leftProfileView.layer.shadowRadius = 7;
    self.leftProfileView.layer.shadowOpacity = .5;
    [self.tableView addSubview:self.leftProfileView];
    
    self.userPhoto = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, 90, 90)];
    self.userPhoto.image = [UIImage imageNamed:@"johnny"];
    self.userPhoto.layer.cornerRadius = 10;
    self.userPhoto.clipsToBounds = YES;
    
    [self.leftProfileView addSubview:self.userPhoto];
    
        
    
    
    SlideNavigationContorllerAnimatorScale *scale =
    [[SlideNavigationContorllerAnimatorScale alloc]init];
    
    [SlideNavigationController sharedInstance].menuRevealAnimationDuration = 0.2;
    [SlideNavigationController sharedInstance].menuRevealAnimator = scale;
    

    
    
    
}


//為了讓leftProfileView不會被滾動
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.leftProfileView.transform = CGAffineTransformMakeTranslation(0, scrollView.contentOffset.y);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return menuArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftMenuCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.menuLabel.text = menuArray[indexPath.row];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *controller;
    switch (indexPath.row) {
        case 0:
            controller = [[HomeVC alloc]init];
            break;
            
        case 1:
            controller = [[SecondVC alloc] init];
            
        case 2:
            controller = [[ThirdVC alloc] init];

            
        default:
            break;
}
    
    
    
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:controller
                                                             withSlideOutAnimation:self.slideOutAnimationEnabled
                                                                     andCompletion:nil];
    
    
}


//客制header 高也要另外設定 不然什麼都看不到
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 100)];
    self.headerView.backgroundColor = [UIColor clearColor];
    
    return self.headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 120;
}





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
