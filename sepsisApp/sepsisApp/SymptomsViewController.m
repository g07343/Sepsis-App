//
//  SymptomsViewController.m
//  sepsisApp
//
//  Created by Matthew Lewis on 3/6/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import "SymptomsViewController.h"

@interface SymptomsViewController ()

@end

@implementation SymptomsViewController

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
    //set up our counter int
    cycle = 0;
    
    //set up our labels' text
    TemperatureLabel.text = @"\u2022 Temperature high or low. Above 101 or below 97";
    respirationsLabel.text = @"\u2022 Respirations above 20 per minute";
    rateLabel.text = @"\u2022 Pulse greater than 90 per minute";
	
    //create image objects for each avatar
    tempImage = [UIImage imageNamed:@"temperature.png"];
    respImage = [UIImage imageNamed:@"respiratory.png"];
    rateImage = [UIImage imageNamed:@"heartRate.png"];
    
    //create arrays to hold our images and text labels
    labelsArray = [[NSArray alloc] initWithObjects:TemperatureLabel, rateLabel, respirationsLabel, nil];
    imagesArray = [[NSArray alloc] initWithObjects:tempImage, rateImage, respImage, nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)switchImages
{
    int oldvalue = cycle -1;
    UILabel *finalLabel = [labelsArray objectAtIndex:2];
    if (finalLabel.textColor == [UIColor yellowColor])
    {
        finalLabel.textColor = [UIColor whiteColor];
    }
    manImages.image = nil;
    manImages.image = [imagesArray objectAtIndex:cycle];
    UILabel *activeLabel = [labelsArray objectAtIndex:cycle];

    if (oldvalue >= 0)
    {
        UILabel *oldLabel = [labelsArray objectAtIndex:oldvalue];
        oldLabel.textColor = [UIColor whiteColor];
    }
    activeLabel.textColor = [UIColor yellowColor];
    cycle++;
    if (cycle == 3)
    {
        cycle = 0;
    }
}
//custom methods to stop and start timer called when the parent container view is shown or hidden
-(void)stopTimer
{
    [avatarTimer invalidate];
    avatarTimer = nil;
}

-(void)startTimer
{
    avatarTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(switchImages) userInfo:nil repeats:YES];
}

@end
