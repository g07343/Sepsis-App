//
//  CustomCell.m
//  sepsisApp
//
//  Created by Matthew Lewis on 3/5/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize labelString;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        labelString = @"";
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {
            self.frame = CGRectMake(0, 0, 320.0f, 123.0f);
        } else {
            self.frame = CGRectMake(0, 0, 190.0f, 123.0f);
        }
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellValues
{   
    titleLabel.text = labelString;
}

@end
