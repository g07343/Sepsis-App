//
//  MoreInfoViewController.m
//  sepsisApp
//
//  Created by Matthew Lewis on 3/16/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import "MoreInfoViewController.h"

@interface MoreInfoViewController ()

@end

@implementation MoreInfoViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(id)sender
{
    UIButton *button = (UIButton*)sender;
    if (button.tag == 0) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.sepsiswatch.org/"]];
    } else if (button.tag == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.sepsisalliance.org/"]];
    } else if (button.tag == 2) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.globalsepsisalliance.com/"]];
    } else if (button.tag == 3) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.world-sepsis-day.org/"]];
    } else if (button.tag == 4) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.sepsistrust.org/"]];
    } else if (button.tag == 5) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://cdc.gov/sepsis/"]];
    }
    
}

@end
