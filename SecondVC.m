//
//  SecondVC.m
//  SlideMenuTest1122
//
//  Created by 劉坤昶 on 2015/11/22.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "SecondVC.h"

@interface SecondVC () 
@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    self.title = @"我的課程";

}






- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
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
