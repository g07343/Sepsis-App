//
//  iPadCustomCell.h
//  sepsisApp
//
//  Created by Matthew Lewis on 3/5/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iPadCustomCell : UITableViewCell
{
    IBOutlet UILabel *titleLabel;
}
-(void)setCellValues;
@property (strong, nonatomic) NSString *labelString;
@end
