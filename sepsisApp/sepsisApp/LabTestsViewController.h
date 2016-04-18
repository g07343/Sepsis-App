//
//  LabTestsViewController.h
//  sepsisApp
//
//  Created by Matthew Lewis on 3/12/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabTestsViewController : UIViewController
{
    IBOutlet UIView *rootView;
    IBOutlet UIView *lactateView;
    IBOutlet UIView *whiteCellView;
    IBOutlet UIView *procalView;
    IBOutlet UIImageView *deviceScreen;
    IBOutlet UITextView *lactateDescription;
    IBOutlet UIButton *lactateDevice;
    IBOutlet UILabel *lactateInstruction;
    IBOutlet UIButton *lactateStrip;
    IBOutlet UIButton *touchArea;
    IBOutlet UIButton *backBtn;
    NSString *active;
    IBOutlet UIImageView *whiteCellanimation;
    NSArray *whiteCellImages;
    NSArray *procalImages;
    NSTimer *animationTimer;
    int animationCounter;
    IBOutlet UIImageView *procalAnimation;
}
-(IBAction)selectTest:(id)sender;
-(IBAction)onClick:(id)sender;
-(void)resetAll;
@end
