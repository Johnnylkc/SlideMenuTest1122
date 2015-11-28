//
//  LeftMenuCell.m
//  SlideMenuTest1122
//
//  Created by 劉坤昶 on 2015/11/22.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "LeftMenuCell.h"

@implementation LeftMenuCell

- (void)awakeFromNib {
    // Initialization code
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.menuLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 50,  180, 50)];
        self.menuLabel.textColor = [UIColor whiteColor];
        self.menuLabel.font = [UIFont boldSystemFontOfSize:20];
        [self.contentView addSubview:self.menuLabel];
        
        
    }
    
    
    return  self;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
