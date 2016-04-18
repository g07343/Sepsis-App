//
//  HowViewController.m
//  sepsisApp
//
//  Created by Matthew Lewis on 3/10/14.
//  Copyright (c) 2014 com.sepsisWatch.sepsisApp. All rights reserved.
//

#import "HowViewController.h"

@interface HowViewController ()

@end

@implementation HowViewController
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

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
    touchEnabled = true;
    bacteria.hidden = true;
    continueBtn.hidden = true;
    continueCirculationBtn.hidden = true;
    circulationView.hidden = true;
    organView.hidden = true;
    resetX = magnifyingLens.frame.origin.x;
    resetY = magnifyingLens.frame.origin.y;
    
	//set up our array to hold the images for the circulation animation
    circulationImages = @[@"/circulate0001.png",
                          @"/circulate0002.png",
                          @"/circulate0003.png",
                          @"/circulate0004.png",
                          @"/circulate0005.png",
                          @"/circulate0006.png",
                          @"/circulate0007.png",
                          @"/circulate0008.png",
                          @"/circulate0009.png",
                          @"/circulate0010.png",
                          @"/circulate0011.png",
                          @"/circulate0012.png",
                          @"/circulate0013.png",
                          @"/circulate0014.png",
                          @"/circulate0015.png",
                          @"/circulate0016.png",
                          @"/circulate0017.png",
                          @"/circulate0018.png",
                          @"/circulate0019.png",
                          @"/circulate0020.png",
                          @"/circulate0021.png",
                          @"/circulate0022.png",
                          @"/circulate0023.png",
                          @"/circulate0024.png",
                          @"/circulate0025.png",
                          @"/circulate0026.png",
                          @"/circulate0027.png",
                          @"/circulate0028.png",
                          @"/circulate0029.png",
                          @"/circulate0030.png",
                          @"/circulate0031.png",
                          @"/circulate0032.png",
                          @"/circulate0033.png",
                          @"/circulate0034.png",
                          @"/circulate0035.png",
                          @"/circulate0036.png",
                          @"/circulate0037.png",
                          @"/circulate0038.png",
                          @"/circulate0039.png",
                          @"/circulate0040.png",
                          @"/circulate0041.png",
                          @"/circulate0042.png",
                          @"/circulate0043.png",
                          @"/circulate0044.png",
                          @"/circulate0045.png",
                          @"/circulate0046.png",
                          @"/circulate0047.png",
                          @"/circulate0048.png",
                          @"/circulate0049.png",
                          @"/circulate0050.png",
                          @"/circulate0051.png",
                          @"/circulate0052.png",
                          @"/circulate0053.png",
                          @"/circulate0054.png",
                          @"/circulate0055.png",
                          @"/circulate0056.png",
                          @"/circulate0057.png",
                          @"/circulate0058.png",
                          @"/circulate0059.png",
                          @"/circulate0060.png",
                          @"/circulate0061.png",
                          @"/circulate0062.png",
                          @"/circulate0063.png",
                          @"/circulate0064.png",
                          @"/circulate0065.png",
                          @"/circulate0066.png",
                          @"/circulate0067.png",
                          @"/circulate0068.png",
                          @"/circulate0069.png",
                          @"/circulate0070.png",
                          @"/circulate0071.png",
                          @"/circulate0072.png",
                          @"/circulate0073.png",
                          @"/circulate0074.png",
                          @"/circulate0075.png",
                          @"/circulate0076.png",
                          @"/circulate0077.png",
                          @"/circulate0078.png",
                          @"/circulate0079.png",
                          @"/circulate0080.png",
                          @"/circulate0081.png",
                          @"/circulate0082.png",
                          @"/circulate0083.png",
                          @"/circulate0084.png",
                          @"/circulate0085.png",
                          @"/circulate0086.png",
                          @"/circulate0087.png",
                          @"/circulate0088.png",
                          @"/circulate0089.png",
                          @"/circulate0090.png",
                          @"/circulate0091.png",
                          @"/circulate0092.png",
                          @"/circulate0093.png",
                          @"/circulate0094.png",
                          @"/circulate0095.png",
                          @"/circulate0096.png",
                          @"/circulate0097.png",
                          @"/circulate0098.png",
                          @"/circulate0099.png",
                          @"/circulate0100.png",
                          @"/circulate0101.png",
                          @"/circulate0102.png",
                          @"/circulate0103.png",
                          @"/circulate0104.png",
                          @"/circulate0105.png",
                          @"/circulate0106.png",
                          @"/circulate0107.png",
                          @"/circulate0108.png",
                          @"/circulate0109.png",
                          @"/circulate0110.png",
                          @"/circulate0111.png",
                          @"/circulate0112.png",
                          @"/circulate0113.png",
                          @"/circulate0114.png",
                          @"/circulate0115.png",
                          @"/circulate0116.png",
                          @"/circulate0117.png",
                          @"/circulate0118.png",
                          @"/circulate0119.png",
                          @"/circulate0120.png",
                          @"/circulate0121.png",
                          @"/circulate0122.png",
                          @"/circulate0123.png",
                          @"/circulate0124.png",
                          @"/circulate0125.png",
                          @"/circulate0126.png",
                          @"/circulate0127.png",
                          @"/circulate0128.png",
                          @"/circulate0129.png",
                          @"/circulate0130.png",
                          @"/circulate0131.png",
                          @"/circulate0132.png",
                          @"/circulate0133.png",
                          @"/circulate0134.png",
                          @"/circulate0135.png",
                          @"/circulate0136.png",
                          @"/circulate0137.png",
                          @"/circulate0138.png",
                          @"/circulate0139.png",
                          @"/circulate0140.png",
                          @"/circulate0141.png",];
    
    organImages = @[@"/organs_mc0001.png",
                    @"/organs_mc0002.png",
                    @"/organs_mc0003.png",
                    @"/organs_mc0004.png",
                    @"/organs_mc0005.png",
                    @"/organs_mc0006.png",
                    @"/organs_mc0007.png",
                    @"/organs_mc0008.png",
                    @"/organs_mc0009.png",
                    @"/organs_mc0010.png",
                    @"/organs_mc0011.png",
                    @"/organs_mc0012.png",
                    @"/organs_mc0013.png",
                    @"/organs_mc0014.png",
                    @"/organs_mc0015.png",
                    @"/organs_mc0016.png",
                    @"/organs_mc0017.png",
                    @"/organs_mc0018.png",
                    @"/organs_mc0019.png",
                    @"/organs_mc0020.png",
                    @"/organs_mc0021.png",
                    @"/organs_mc0022.png",
                    @"/organs_mc0023.png",
                    @"/organs_mc0024.png",
                    @"/organs_mc0025.png",
                    @"/organs_mc0026.png",
                    @"/organs_mc0027.png",
                    @"/organs_mc0028.png",
                    @"/organs_mc0029.png",
                    @"/organs_mc0030.png",
                    @"/organs_mc0031.png",
                    @"/organs_mc0032.png",
                    @"/organs_mc0033.png",
                    @"/organs_mc0034.png",
                    @"/organs_mc0035.png",
                    @"/organs_mc0036.png",
                    @"/organs_mc0037.png",
                    @"/organs_mc0038.png",
                    @"/organs_mc0039.png",
                    @"/organs_mc0040.png",
                    @"/organs_mc0041.png",
                    @"/organs_mc0042.png",
                    @"/organs_mc0043.png",
                    @"/organs_mc0044.png",
                    @"/organs_mc0045.png",
                    @"/organs_mc0046.png",
                    @"/organs_mc0047.png",
                    @"/organs_mc0048.png",
                    @"/organs_mc0049.png",
                    @"/organs_mc0050.png",
                    @"/organs_mc0051.png",
                    @"/organs_mc0052.png",
                    @"/organs_mc0053.png",
                    @"/organs_mc0054.png",
                    @"/organs_mc0055.png",
                    @"/organs_mc0056.png",
                    @"/organs_mc0057.png",
                    @"/organs_mc0058.png",
                    @"/organs_mc0059.png",
                    @"/organs_mc0060.png",
                    @"/organs_mc0061.png",
                    @"/organs_mc0062.png",
                    @"/organs_mc0063.png",
                    @"/organs_mc0064.png",
                    @"/organs_mc0065.png",
                    @"/organs_mc0066.png",
                    @"/organs_mc0067.png",
                    @"/organs_mc0068.png",
                    @"/organs_mc0069.png",
                    @"/organs_mc0070.png",
                    @"/organs_mc0071.png",
                    @"/organs_mc0072.png",
                    @"/organs_mc0073.png",
                    @"/organs_mc0074.png",
                    @"/organs_mc0075.png",
                    @"/organs_mc0076.png",
                    @"/organs_mc0077.png",
                    @"/organs_mc0078.png",
                    @"/organs_mc0079.png",
                    @"/organs_mc0080.png",
                    @"/organs_mc0081.png",
                    @"/organs_mc0082.png",
                    @"/organs_mc0083.png",
                    @"/organs_mc0084.png",
                    @"/organs_mc0085.png",
                    @"/organs_mc0086.png",
                    @"/organs_mc0087.png",
                    @"/organs_mc0088.png",
                    @"/organs_mc0089.png",
                    @"/organs_mc0090.png",
                    @"/organs_mc0091.png",
                    @"/organs_mc0092.png",
                    @"/organs_mc0093.png",
                    @"/organs_mc0094.png",
                    @"/organs_mc0095.png",
                    @"/organs_mc0096.png",
                    @"/organs_mc0097.png",
                    @"/organs_mc0098.png",
                    @"/organs_mc0099.png",
                    @"/organs_mc0100.png",
                    @"/organs_mc0101.png",
                    @"/organs_mc0102.png",
                    @"/organs_mc0103.png",
                    @"/organs_mc0104.png",
                    @"/organs_mc0105.png",
                    @"/organs_mc0106.png",
                    @"/organs_mc0107.png",
                    @"/organs_mc0108.png",
                    @"/organs_mc0109.png",
                    @"/organs_mc0110.png",
                    @"/organs_mc0111.png",
                    @"/organs_mc0112.png",
                    @"/organs_mc0113.png",
                    @"/organs_mc0114.png",
                    @"/organs_mc0115.png",
                    @"/organs_mc0116.png",
                    @"/organs_mc0117.png",
                    @"/organs_mc0118.png",
                    @"/organs_mc0119.png",
                    @"/organs_mc0120.png",
                    @"/organs_mc0121.png",
                    @"/organs_mc0122.png",
                    @"/organs_mc0123.png",
                    @"/organs_mc0124.png",
                    @"/organs_mc0125.png",
                    @"/organs_mc0126.png",
                    @"/organs_mc0127.png",
                    @"/organs_mc0128.png",
                    @"/organs_mc0129.png",
                    @"/organs_mc0130.png",
                    @"/organs_mc0131.png",
                    @"/organs_mc0132.png",
                    @"/organs_mc0133.png",
                    @"/organs_mc0134.png",
                    @"/organs_mc0135.png",
                    @"/organs_mc0136.png",
                    @"/organs_mc0137.png",
                    @"/organs_mc0138.png",
                    @"/organs_mc0139.png",
                    @"/organs_mc0140.png",
                    @"/organs_mc0141.png",
                    @"/organs_mc0142.png",
                    @"/organs_mc0143.png",
                    @"/organs_mc0144.png",
                    @"/organs_mc0145.png",
                    @"/organs_mc0146.png",
                    @"/organs_mc0147.png",
                    @"/organs_mc0148.png",
                    @"/organs_mc0149.png",
                    @"/organs_mc0150.png",
                    @"/organs_mc0151.png",
                    @"/organs_mc0152.png",
                    @"/organs_mc0153.png",
                    @"/organs_mc0154.png",
                    @"/organs_mc0155.png",
                    @"/organs_mc0156.png",
                    @"/organs_mc0157.png",
                    @"/organs_mc0158.png",
                    @"/organs_mc0159.png",
                    @"/organs_mc0160.png",
                    @"/organs_mc0161.png",
                    @"/organs_mc0162.png",
                    @"/organs_mc0163.png",
                    @"/organs_mc0164.png",
                    @"/organs_mc0165.png",
                    @"/organs_mc0166.png",
                    @"/organs_mc0167.png",
                    @"/organs_mc0168.png",
                    @"/organs_mc0169.png",
                    @"/organs_mc0170.png",
                    @"/organs_mc0171.png",
                    @"/organs_mc0172.png",
                    @"/organs_mc0173.png",
                    @"/organs_mc0174.png",
                    @"/organs_mc0175.png",
                    @"/organs_mc0176.png",
                    @"/organs_mc0177.png",
                    @"/organs_mc0178.png",
                    @"/organs_mc0179.png",
                    @"/organs_mc0180.png",
                    @"/organs_mc0181.png",
                    @"/organs_mc0182.png",
                    @"/organs_mc0183.png",
                    @"/organs_mc0184.png",
                    @"/organs_mc0185.png",
                    @"/organs_mc0186.png",
                    @"/organs_mc0187.png",
                    @"/organs_mc0188.png",
                    @"/organs_mc0189.png",
                    @"/organs_mc0190.png",
                    @"/organs_mc0191.png",
                    @"/organs_mc0192.png",
                    @"/organs_mc0193.png",
                    @"/organs_mc0194.png",
                    @"/organs_mc0195.png",
                    @"/organs_mc0196.png",
                    @"/organs_mc0197.png",
                    @"/organs_mc0198.png",
                    @"/organs_mc0199.png",
                    @"/organs_mc0200.png",
                    @"/organs_mc0201.png",
                    @"/organs_mc0202.png",
                    @"/organs_mc0203.png",
                    @"/organs_mc0204.png",
                    @"/organs_mc0205.png",
                    @"/organs_mc0206.png",
                    @"/organs_mc0207.png",
                    @"/organs_mc0208.png",
                    @"/organs_mc0209.png",
                    @"/organs_mc0210.png",
                    @"/organs_mc0211.png",
                    @"/organs_mc0212.png",
                    @"/organs_mc0213.png",
                    @"/organs_mc0214.png",
                    @"/organs_mc0215.png",
                    @"/organs_mc0216.png",
                    @"/organs_mc0217.png",
                    @"/organs_mc0218.png",
                    @"/organs_mc0219.png",
                    @"/organs_mc0220.png",
                    @"/organs_mc0221.png",
                    @"/organs_mc0222.png",
                    @"/organs_mc0223.png",
                    @"/organs_mc0224.png",
                    @"/organs_mc0225.png",
                    @"/organs_mc0226.png",
                    @"/organs_mc0227.png",
                    @"/organs_mc0228.png",
                    @"/organs_mc0229.png",
                    @"/organs_mc0230.png",
                    @"/organs_mc0231.png",
                    @"/organs_mc0232.png",
                    @"/organs_mc0233.png",
                    @"/organs_mc0234.png",
                    @"/organs_mc0235.png",
                    @"/organs_mc0236.png",
                    @"/organs_mc0237.png",
                    @"/organs_mc0238.png",
                    @"/organs_mc0239.png",
                    @"/organs_mc0240.png",
                    @"/organs_mc0241.png",
                    @"/organs_mc0242.png",
                    @"/organs_mc0243.png",
                    @"/organs_mc0244.png",
                    @"/organs_mc0245.png",
                    @"/organs_mc0246.png",
                    @"/organs_mc0247.png",
                    @"/organs_mc0248.png",
                    @"/organs_mc0249.png",
                    @"/organs_mc0250.png",
                    @"/organs_mc0251.png",
                    @"/organs_mc0252.png",
                    @"/organs_mc0253.png",
                    @"/organs_mc0254.png",
                    @"/organs_mc0255.png",
                    @"/organs_mc0256.png",
                    @"/organs_mc0257.png",
                    @"/organs_mc0258.png",
                    @"/organs_mc0259.png",
                    @"/organs_mc0260.png",
                    @"/organs_mc0261.png",
                    @"/organs_mc0262.png",
                    @"/organs_mc0263.png",
                    @"/organs_mc0264.png",
                    @"/organs_mc0265.png",
                    @"/organs_mc0266.png",
                    @"/organs_mc0267.png",
                    @"/organs_mc0268.png",
                    @"/organs_mc0269.png",
                    @"/organs_mc0270.png",
                    @"/organs_mc0271.png",
                    @"/organs_mc0272.png",
                    @"/organs_mc0273.png",
                    @"/organs_mc0274.png",
                    @"/organs_mc0275.png",
                    @"/organs_mc0276.png",
                    @"/organs_mc0277.png",
                    @"/organs_mc0278.png",
                    @"/organs_mc0279.png",
                    @"/organs_mc0280.png",
                    @"/organs_mc0281.png",
                    @"/organs_mc0282.png",
                    @"/organs_mc0283.png",
                    @"/organs_mc0284.png",
                    @"/organs_mc0285.png",
                    @"/organs_mc0286.png",
                    @"/organs_mc0287.png",
                    @"/organs_mc0288.png",
                    @"/organs_mc0289.png",
                    @"/organs_mc0290.png",
                    @"/organs_mc0291.png",
                    @"/organs_mc0292.png",
                    @"/organs_mc0293.png",
                    @"/organs_mc0294.png",
                    @"/organs_mc0295.png",
                    @"/organs_mc0296.png",
                    @"/organs_mc0297.png",
                    @"/organs_mc0298.png",
                    @"/organs_mc0299.png",
                    @"/organs_mc0300.png",
                    @"/organs_mc0301.png",
                    @"/organs_mc0302.png",
                    @"/organs_mc0303.png",
                    @"/organs_mc0304.png",
                    @"/organs_mc0305.png",
                    @"/organs_mc0306.png",
                    @"/organs_mc0307.png",
                    @"/organs_mc0308.png",
                    @"/organs_mc0309.png",
                    @"/organs_mc0310.png",
                    @"/organs_mc0311.png",
                    @"/organs_mc0312.png",
                    @"/organs_mc0313.png",
                    @"/organs_mc0314.png",
                    @"/organs_mc0315.png",
                    @"/organs_mc0316.png",
                    @"/organs_mc0317.png",
                    @"/organs_mc0318.png",
                    @"/organs_mc0319.png",
                    @"/organs_mc0320.png",
                    @"/organs_mc0321.png",
                    @"/organs_mc0322.png",
                    @"/organs_mc0323.png",
                    @"/organs_mc0324.png",
                    @"/organs_mc0325.png",
                    @"/organs_mc0326.png",
                    @"/organs_mc0327.png",
                    @"/organs_mc0328.png",
                    @"/organs_mc0329.png",
                    @"/organs_mc0330.png",
                    @"/organs_mc0331.png",
                    @"/organs_mc0332.png",
                    @"/organs_mc0333.png",
                    @"/organs_mc0334.png",
                    @"/organs_mc0335.png",
                    @"/organs_mc0336.png",
                    @"/organs_mc0337.png",
                    @"/organs_mc0338.png",
                    @"/organs_mc0339.png",
                    @"/organs_mc0340.png",
                    @"/organs_mc0341.png",
                    @"/organs_mc0342.png",
                    @"/organs_mc0343.png",
                    @"/organs_mc0344.png",
                    @"/organs_mc0345.png",
                    @"/organs_mc0346.png",
                    @"/organs_mc0347.png",
                    @"/organs_mc0348.png",
                    @"/organs_mc0349.png",
                    @"/organs_mc0350.png",];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//allow user to drag the magnifying lens to the knee
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (touchEnabled == true)
    {
        UITouch *touch = [[event allTouches] anyObject];
        CGPoint location = [touch locationInView:touch.view];
        magnifyingLens.center = location;
        [self ifCollided];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesBegan:touches withEvent:event];
}
//detect if the magnifying lens imageView's frame makes contact with the knee imageView's frame
-(void)ifCollided
{
    if (CGRectIntersectsRect(magnifyingLens.frame, dragHotspot.frame))
    {
        //set our bool value to false so we disallow any more dragging
        touchEnabled = false;
        bacteria.hidden = false;
        continueBtn.hidden = false;
        //need to determine device in order to position the magnifying lens correctly after it is "droppped"
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {
            //manually set the frame of the magnifying lens over the bleeding area and make the bacteria image view "appear"
            magnifyingLens.frame = CGRectMake(27.0f, 479.0f, 240, 128);
        } else {
            if (IS_IPHONE_5)
            {
                //magnifyingLens.frame = CGRectMake(82.0f, 214.0f, 115, 62);
                 magnifyingLens.frame = CGRectMake(bacteria.frame.origin.x, bacteria.frame.origin.y, 115, 62);
            } else {
                magnifyingLens.frame = CGRectMake(bacteria.frame.origin.x, bacteria.frame.origin.y, 115, 62);
            }
        }
        
    }
}

-(IBAction)onClick:(id)sender
{
    if (mainView.hidden == false)
    {
        mainView.hidden = true;
        circulationView.hidden = false;
        circulationTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(animateCirculation) userInfo:nil repeats:YES];
    } else if (mainView.hidden == true)
    {
        NSLog(@"mainView is hidden");
        circulationView.hidden = true;
        organView.hidden = false;
        [circulationTimer invalidate];
        circulationTimer = nil;
        circulationTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(animateOrgans) userInfo:nil repeats:YES];
    }
}

-(void)animateCirculation
{
    NSString *fullpath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[circulationImages objectAtIndex:circulationCounter]];
    circulationAnimation.image = nil;
    circulationAnimation.image = [UIImage imageWithContentsOfFile:fullpath];
    circulationCounter ++;
    if (circulationCounter == 141)
    {
        circulationCounter = 0;
        continueCirculationBtn.hidden = false;
    }
}

-(void)animateOrgans
{
    NSString *fullPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:[organImages objectAtIndex:organCounter]];
    organsAnimation.image = nil;
    organsAnimation.image = [UIImage imageWithContentsOfFile:fullPath];
    organCounter ++;
    if (organCounter == 350)
    {
        organCounter = 0;
    }
}

-(void)stopAnimations
{
    [circulationTimer invalidate];
    circulationTimer = nil;
}

-(void)reloadView
{
    touchEnabled = true;
    CGRect frame = magnifyingLens.frame;
    
    frame.origin.x = resetX;
    frame.origin.y = resetY;
    magnifyingLens.frame = frame;
    
    mainView.hidden = false;
    bacteria.hidden = true;
    continueBtn.hidden = true;
    continueCirculationBtn.hidden = true;
    circulationView.hidden = true;
    organView.hidden = true;
}

@end
