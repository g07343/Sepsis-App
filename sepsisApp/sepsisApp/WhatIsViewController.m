//
//  WhatIsViewController.m
//  sepsisApp
//
//  Created by Matthew Lewis on 3/5/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import "WhatIsViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface WhatIsViewController ()

@end

@implementation WhatIsViewController
@synthesize moviePlayer;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSString *whatIsLocationString = [[NSBundle mainBundle] pathForResource:@"what is sepsis" ofType:@"mp4"];
    NSURL *locationURL = [NSURL fileURLWithPath:whatIsLocationString];
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:locationURL];
    moviePlayer.fullscreen = false;
    moviePlayer.controlStyle = MPMovieControlStyleDefault;
    moviePlayer.movieSourceType = MPMovieSourceTypeFile;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{   //manually set the frame here instead of viewDidLoad since this view uses auto Layout and constraints and screws up video sizing otherwise.
    moviePlayer.view.frame = CGRectMake(movieButton.frame.origin.x, movieButton.frame.origin.y, movieButton.frame.size.width, movieButton.frame.size.height);
    [self.view addSubview:moviePlayer.view];
    [moviePlayer prepareToPlay];
    [moviePlayer play];
    
    NSLog(@"WHAT IS:  Button frame...width: %f, height: %f, originX: %f, originY: %f", movieButton.frame.size.width, movieButton.frame.size.height, movieButton.frame.origin.x, movieButton.frame.origin.y);
    
    NSLog(@"WHAT IS:  Actual video frame...width: %f, height: %f, originX: %f, originY: %f", moviePlayer.view.frame.size.width, moviePlayer.view.frame.size.height, moviePlayer.view.frame.origin.x, moviePlayer.view.frame.origin.y);
}

-(void)stopPlayback
{
    [moviePlayer stop];
    [moviePlayer.view removeFromSuperview];
}

@end
