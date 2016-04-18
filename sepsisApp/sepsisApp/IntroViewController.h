//
//  IntroViewController.h
//  sepsisApp
//
//  Created by Matthew Lewis on 3/4/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroViewController : UIViewController
{
    IBOutlet UIButton *skipButton;
    IBOutlet UIImageView *introHolder;
    NSArray *introImages;
    NSTimer *animationTimer;
    NSTimer *dismissTimer;
    UIImage *currentImage;
    int animationCounter;
}
-(IBAction)onClick:(id)sender;
@end
