//
//  SymptomsViewController.h
//  sepsisApp
//
//  Created by Matthew Lewis on 3/6/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SymptomsViewController : UIViewController
{
    IBOutlet UILabel *urineLabel;
    IBOutlet UILabel *chillsLabel;
    IBOutlet UILabel *TemperatureLabel;
    IBOutlet UILabel *pressureLabel;
    IBOutlet UILabel *respirationsLabel;
    IBOutlet UILabel *rateLabel;
    IBOutlet UIImageView *manImages;
    NSTimer *avatarTimer;
    UIImage *urineImage;
    UIImage *chillsImage;
    UIImage *tempImage;
    UIImage *pressureImage;
    UIImage *respImage;
    UIImage *rateImage;
    NSArray *labelsArray;
    NSArray *imagesArray;
    int cycle;
}
-(void)startTimer;
-(void)stopTimer;
@end
