//
//  ClassCell.m
//  SlideMenuTest1122
//
//  Created by 劉坤昶 on 2015/11/23.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "ClassCell.h"

@implementation ClassCell

- (void)awakeFromNib {
    // Initialization code
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
       
        self.classImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 60, 50)];
        self.classImage.contentMode = UIViewContentModeScaleAspectFill;
        self.classImage.clipsToBounds = YES;
        [self.contentView addSubview:self.classImage];
        
        
        self.classNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 5, 120, 20)];
        self.classNameLabel.textColor = [UIColor blueColor];
        self.classNameLabel.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:self.classNameLabel];
    
    
    
    }
        return self;
}







- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
