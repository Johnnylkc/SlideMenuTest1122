//
//  HomeCell.m
//  SlideMenuTest1122
//
//  Created by 劉坤昶 on 2015/11/22.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self= [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.bigPhoto =
        [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 150)];
        self.bigPhoto.contentMode = UIViewContentModeScaleAspectFill;
        self.bigPhoto.clipsToBounds = YES;
        [self.contentView addSubview:self.bigPhoto];
        
    }
    
    
    return  self;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
