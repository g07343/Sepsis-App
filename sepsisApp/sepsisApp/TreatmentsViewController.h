//
//  TreatmentsViewController.h
//  sepsisApp
//
//  Created by Matthew Lewis on 3/14/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TreatmentsViewController : UIViewController
{
    IBOutlet UILabel *descriptionLabel;
    IBOutlet UILabel *titleLabel;
    IBOutlet UIView *antibioticsView;
    IBOutlet UIView *ivView;
    IBOutlet UIView *vasopressorView;
    IBOutlet UIView *steroidView;
    IBOutlet UIImageView *antibioticsAnimation;
    IBOutlet UIImageView *ivAnimation;
    IBOutlet UIImageView *steroidAnimation;
    IBOutlet UIImageView *vasopressorAnimation;
    UIButton *vasopressorButton;
    UIButton *ivButton;
    UIButton *antibioticsButton;
    UIButton *steroidButton;
    NSArray *antibioticsImages;
    NSArray *ivImages;
    NSArray *steroidImages;
    NSArray *vasopressorImages;
    NSTimer *animationTimer;
    int animationCounter;
}

-(IBAction)onClick:(id)sender;
-(void)resetAll;
@end
