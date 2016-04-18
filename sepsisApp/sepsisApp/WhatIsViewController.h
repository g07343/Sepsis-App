//
//  WhatIsViewController.h
//  sepsisApp
//
//  Created by Matthew Lewis on 3/5/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface WhatIsViewController : UIViewController
{
    IBOutlet UIButton *movieButton;
}

-(void)stopPlayback;
-(IBAction)onClick:(id)sender;
@property MPMoviePlayerController *moviePlayer;
@end
