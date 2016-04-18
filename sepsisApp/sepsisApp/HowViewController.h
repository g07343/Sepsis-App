//
//  HowViewController.h
//  sepsisApp
//
//  Created by Matthew Lewis on 3/10/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HowViewController : UIViewController
{
    IBOutlet UIImageView *magnifyingLens;
    IBOutlet UIImageView *knee;
    IBOutlet UIImageView *bacteria;
    IBOutlet UIView *dragHotspot;
    IBOutlet UIButton *continueBtn;
    IBOutlet UIButton *continueCirculationBtn;
    IBOutlet UIView *mainView;
    IBOutlet UIView *circulationView;
    IBOutlet UIView *organView;
    IBOutlet UIImageView *circulationAnimation;
    IBOutlet UIImageView *organsAnimation;
    NSArray *circulationImages;
    NSArray *organImages;
    NSTimer *circulationTimer;
    BOOL touchEnabled;
    int circulationCounter;
    int organCounter;
    int resetX;
    int resetY;
}
-(IBAction)onClick:(id)sender;
-(void)stopAnimations;
-(void)reloadView;
@end
