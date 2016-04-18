//
//  testViewController.m
//  sepsisApp
//
//  Created by Matthew Lewis on 3/3/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import "testViewController.h"
#import "IntroViewController.h"
#import "CustomCell.h"
#import "iPadCustomCell.h"
#import "WhatIsViewController.h"
#import "SymptomsViewController.h"

@interface testViewController ()

@end

@implementation testViewController
//#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] nativeBounds ].size.height - ( double )1136 ) < DBL_EPSILON )
//#define IS_IPHONE_6_PLUS ( fabs( ( double )[ [ UIScreen mainScreen ] nativeBounds ].size.height - ( double )1704 ) < DBL_EPSILON )

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//#define IS_IPHONE_6P_IOS8 (IS_IPHONE && ([[UIScreen mainScreen] nativeBounds].size.height/[[UIScreen mainScreen] nativeScale]) == 736.0f)

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self hideAll];
    
    if( [ [ UIScreen mainScreen ] respondsToSelector: @selector( nativeBounds ) ] )
    {
        /* Detect using nativeBounds - iOS 8 and greater */
        #define IS_IPHONE_5_IOS8 ( fabs( ( double )[ [ UIScreen mainScreen ] nativeBounds ].size.height - ( double )1136 ) < DBL_EPSILON )
        #define IS_IPHONE_6P ( fabs( ( double )[ [ UIScreen mainScreen ] nativeBounds ].size.height - ( double )1704 ) < DBL_EPSILON )
        int size = [[UIScreen mainScreen] nativeBounds].size.height;
        NSLog(@"Screen size reported is:  %i", size);
    }
    else
    {
        /* Detect using bounds - iOS 7 and lower */
    }
    
    
    //get our child view controllers for global access
    whatIsController = [self.childViewControllers objectAtIndex:0];
    howController = [self.childViewControllers objectAtIndex:1];
    symptomsController = [self.childViewControllers objectAtIndex:2];
    storiesController = [self.childViewControllers objectAtIndex:3];
    labController = [self.childViewControllers objectAtIndex:4];
    treatmentsController = [self.childViewControllers objectAtIndex:5];
    
    
    //set up our boolean to false so we present the intro
    introRan = false;
    
    //set up our array of titles for the cells in the table view
    tableButtons = [[NSArray alloc] initWithObjects:@"What is sepsis?", @"How do you get sepsis?", @"Sepsis symptoms", @"Sepsis stories", @"Sepsis lab tests", @"Sepsis treatments", @"About B.U.G.S.", @"More info", nil];
    
    //manually set attributes of table view regardless of device
    
    buttonTable.backgroundColor = [UIColor clearColor];
    buttonTable.opaque = NO;
    buttonTable.backgroundView = nil;
    
    //check if on iPad or iPhone so we can utilize the correct storyboard
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        //register our custom iPad cell with the table view
        UINib *customCell = [UINib nibWithNibName:@"iPadCustomCell" bundle:nil];
        if (customCell != nil)
        {
            [buttonTable registerNib:customCell forCellReuseIdentifier:@"cellButton"];
        }
        buttonTable.rowHeight = 123.0f;
    } else {
        if (IS_IPHONE_5 || IS_IPHONE_5_IOS8 || IS_IPHONE_6P)
        {
            UIImage *largerImage = [UIImage imageNamed:@"main_windowBG.png"];
            windowHolder.image = largerImage;
            NSLog(@"iPhone 5 bg used!");
        } else {
            UIImage *smallerImage = [UIImage imageNamed:@"main_windowBGsmall.png"];
            windowHolder.image = smallerImage;
            NSLog(@"Smaller iPhone bg used!");
        }
        //register our custom iPhone cell with the table view
        UINib *customCell = [UINib nibWithNibName:@"CustomCell" bundle:nil];
        if (customCell != nil)
        {
            [buttonTable registerNib:customCell forCellReuseIdentifier:@"cellButton"];
        }
        buttonTable.rowHeight = 90.0f;
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    if (introRan == false)
    {
        //check if on iPad or iPhone so we can utilize the correct storyboard
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
            IntroViewController *introView = (IntroViewController *)[storyboard instantiateViewControllerWithIdentifier:@"IntroViewController"];
            if (introView != nil)
            {
                introRan = true;
                [self presentViewController:introView animated:NO completion:nil];
                blackOverlay.hidden = true;
            }
        } else {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
            IntroViewController *introView = (IntroViewController *)[storyboard instantiateViewControllerWithIdentifier:@"IntroViewController"];
            if (introView != nil)
            {
                introRan = true;
                [self presentViewController:introView animated:NO completion:nil];
                blackOverlay.hidden = true;
            }
        }
    }
}
//how many items will appear in the table view
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

//create cells to populate the table view
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellButton"];
    if (cell != nil)
    {
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSString *label = [tableButtons objectAtIndex:indexPath.row];
        [cell setLabelString:label];
        [cell setCellValues];
        return cell;
    }
    return nil;
}
//user taps one of the custom cells in the table view
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self hideAll];
    if (indexPath.row == 0)
    {
        whatIsContainer.hidden = NO;
    } else if (indexPath.row == 1)
    {
        [howController reloadView];
        howContainer.hidden = NO;
    } else if (indexPath.row == 2)
    {
        [symptomsController startTimer];
        symptomsContainer.hidden = NO;
    } else if (indexPath.row == 3)
    {
        storiesContainer.hidden = NO;
    } else if (indexPath.row == 4)
    {
        labContainer.hidden = NO;
    } else if (indexPath.row == 5)
    {
        treatmentsContainer.hidden = NO;
    } else if (indexPath.row == 6)
    {
        aboutContainer.hidden = NO;
    } else if (indexPath.row == 7)
    {
        infoContainer.hidden = NO;
    }
}

-(void)hideAll
{
    //The below is for getting child view controllers!!!
    //NSArray *childArrays = [[NSArray alloc]initWithArray: self.childViewControllers];
    //NSLog(@"%@", [childArrays description]);
    
    //stop playback of video when whatIs view is left
    [whatIsController stopPlayback];
    
    //stop the timer in the symptoms view from continuously running
    [symptomsController stopTimer];
    
    //stop animation timers within the "how" view controller
    [howController stopAnimations];
    
    //stop any videos that may be playing in the "stories" view
    [storiesController stopPlayback];
    
    //reset the lab tests view
    [labController resetAll];
    
    //reset the treatments view
    [treatmentsController resetAll];
    
    //hide all of our containers
    whatIsContainer.hidden = YES;
    howContainer.hidden = YES;
    symptomsContainer.hidden = YES;
    storiesContainer.hidden = YES;
    labContainer.hidden = YES;
    treatmentsContainer.hidden = YES;
    infoContainer.hidden = YES;
    aboutContainer.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
