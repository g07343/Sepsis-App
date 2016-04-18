//
//  StoriesViewController.h
//  sepsisApp
//
//  Created by Matthew Lewis on 3/11/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface StoriesViewController : UIViewController
{
    IBOutlet UILabel *movieDescription;
    IBOutlet UISegmentedControl *movieToggle;
    IBOutlet UIButton *movieButton;
    NSString *current;
    MPMoviePlayerController *moviePlayer;
}

-(IBAction)onClick:(id)sender;
-(void)stopPlayback;
@end
