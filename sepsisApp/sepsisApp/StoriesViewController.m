//
//  StoriesViewController.m
//  sepsisApp
//
//  Created by Matthew Lewis on 3/11/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import "StoriesViewController.h"

@interface StoriesViewController ()

@end

@implementation StoriesViewController

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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playMovie:) name:MPMoviePlayerLoadStateDidChangeNotification object:moviePlayer];

    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        //format the description label
        movieDescription.frame = CGRectMake(39, 462, 532, 133);
        movieDescription.textAlignment = NSTextAlignmentCenter;
        movieDescription.textColor = [UIColor whiteColor];
        [movieDescription setFont:[UIFont boldSystemFontOfSize:19]];
        current = @"emergency";
        movieDescription.text = @"Get an in-depth look into sepsis, and how it has become one of the world's \"silent\" killers";
        [self.view addSubview:movieDescription];
        [movieToggle addTarget:self action:@selector(swapMovie) forControlEvents:UIControlEventValueChanged];
    } else {
        movieDescription.frame = CGRectMake(180, 205, 324, 90);
        movieDescription.textAlignment = NSTextAlignmentCenter;
        movieDescription.textColor = [UIColor whiteColor];
        [movieDescription setFont:[UIFont boldSystemFontOfSize:11]];
        current = @"emergency";
        movieDescription.text = @"Get an in-depth look into sepsis, and how it has become one of the world's \"silent\" killers";
        [self.view addSubview:movieDescription];
        [movieToggle addTarget:self action:@selector(swapMovie) forControlEvents:UIControlEventValueChanged];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)swapMovie
{
    [self stopPlayback];
    if ([current isEqual: @"emergency"])
    {
        movieDescription.text = @"Learn the story of a sepsis survivor and the harrowing impact this condition had on her and her family.";
        current = @"surviving";
    } else {
        movieDescription.text = @"Get an in-depth look into sepsis, and how it has become one of the world's \"silent\" killers";
        current = @"emergency";
    }
}

-(IBAction)onClick:(id)sender
{
    //make our movieButton invisible
    //set up our movie player
    
    if ([current  isEqual: @"surviving"])
    {
        moviePlayer.movieSourceType = MPMovieSourceTypeFile;
        NSString *videoLocation = [[NSBundle mainBundle] pathForResource:@"turning point" ofType:@"mp4"];
        NSURL *locationURL = [NSURL fileURLWithPath:videoLocation];
        
        NSLog(@"Path to video:  %@", videoLocation);
        
        moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:locationURL];
        moviePlayer.movieSourceType = MPMovieSourceTypeFile;
        //manually set the frame here instead of viewDidLoad since this view uses auto Layout and constraints and screws up video sizing otherwise.
        
        [moviePlayer.view setFrame:CGRectMake(movieButton.frame.origin.x, movieButton.frame.origin.y, movieButton.frame.size.width, movieButton.frame.size.height)];
        
        
        //moviePlayer.scalingMode = MPMovieScalingModeAspectFill;
        moviePlayer.fullscreen = false;
        moviePlayer.controlStyle = MPMovieControlStyleDefault;
        [self.view addSubview:moviePlayer.view];
        
        [moviePlayer prepareToPlay];
        //[moviePlayer play];
        
        
        
        NSLog(@"TURNING POINT:  Button frame...width: %f, height: %f, originX: %f, originY: %f", movieButton.frame.size.width, movieButton.frame.size.height, movieButton.frame.origin.x, movieButton.frame.origin.y);
        
        NSLog(@"TURNING POINT:  Actual video frame...width: %f, height: %f, originX: %f, originY: %f", moviePlayer.view.frame.size.width, moviePlayer.view.frame.size.height, moviePlayer.view.frame.origin.x, moviePlayer.view.frame.origin.y);
        
        
        
        movieButton.hidden = YES;
    }else if ([current isEqual: @"emergency"])
    {
        
        NSString *videoLocation = [[NSBundle mainBundle] pathForResource:@"sepsis emergency" ofType:@"mp4"];
        NSURL *locationURL = [NSURL fileURLWithPath:videoLocation];
        moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:locationURL];
        NSLog(@"Path to video:  %@", videoLocation);
        
        moviePlayer.movieSourceType = MPMovieSourceTypeFile;
        [moviePlayer.view setFrame:CGRectMake(movieButton.frame.origin.x, movieButton.frame.origin.y, movieButton.frame.size.width, movieButton.frame.size.height)];
        moviePlayer.fullscreen = false;
        
        moviePlayer.controlStyle = MPMovieControlStyleDefault;
        //moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
        [self.view addSubview:moviePlayer.view];
        [moviePlayer prepareToPlay];
        //[moviePlayer play];
        
        
        NSLog(@"SEPSIS EMERGENCY:  Button frame...width: %f, height: %f, originX: %f, originY: %f", movieButton.frame.size.width, movieButton.frame.size.height, movieButton.frame.origin.x, movieButton.frame.origin.y);
        
        NSLog(@"SEPSIS EMERGENCY:  Actual video frame...width: %f, height: %f, originX: %f, originY: %f", moviePlayer.view.frame.size.width, moviePlayer.view.frame.size.height, moviePlayer.view.frame.origin.x, moviePlayer.view.frame.origin.y);
        
        movieButton.hidden = YES;
    }
}

-(void)stopPlayback
{
    [moviePlayer stop];
    [moviePlayer.view removeFromSuperview];
    movieButton.hidden = NO;
}

- (void)playMovie:(NSNotification *)notification {
    moviePlayer = notification.object;
    if (moviePlayer.loadState & MPMovieLoadStatePlayable)
    {
        NSLog(@"Movie is Ready to Play");
        [moviePlayer play];
    }
}

@end
