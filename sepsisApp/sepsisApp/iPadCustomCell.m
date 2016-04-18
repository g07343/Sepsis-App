//
//  iPadCustomCell.m
//  sepsisApp
//
//  Created by Matthew Lewis on 3/5/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import "iPadCustomCell.h"

@implementation iPadCustomCell
@synthesize labelString;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        labelString = @"";
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
