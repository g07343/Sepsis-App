//
//  testViewController.h
//  sepsisApp
//
//  Created by Matthew Lewis on 3/3/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SymptomsViewController.h"
#import "WhatIsViewController.h"
#import "HowViewController.h"
#import "StoriesViewController.h"
#import "LabTestsViewController.h"
#import "TreatmentsViewController.h"
#import "MoreInfoViewController.h"
#import "AboutBUGSViewController.h"

@interface testViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    BOOL introRan;
    NSArray *tableButtons;
    IBOutlet UITableView *buttonTable;
    IBOutlet UIView *whatIsContainer;
    IBOutlet UIView *howContainer;
    IBOutlet UIView *symptomsContainer;
    IBOutlet UIView *storiesContainer;
    IBOutlet UIView *labContainer;
    IBOutlet UIView *treatmentsContainer;
    IBOutlet UIView *infoContainer;
    IBOutlet UIView *aboutContainer;
    IBOutlet UIImageView *windowHolder;
    IBOutlet UIImageView *blackOverlay;
    SymptomsViewController *symptomsController;
    WhatIsViewController *whatIsController;
    HowViewController *howController;
    StoriesViewController *storiesController;
    LabTestsViewController *labController;
    TreatmentsViewController *treatmentsController;
}

@end
